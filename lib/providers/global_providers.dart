import 'package:black_theory/utils/shared_preferences_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/shared_preferences_repository.dart';
import '../utils/global_constants.dart';

part "global_providers.g.dart";

/// Provider that exposes the list of client ids of the Rolling.
@Riverpod(keepAlive: true)
class RollingClientIdsList extends _$RollingClientIdsList {

  @override
  List<String> build() => SharedPreferencesRepository.retrieveRollingClientIds();

  // Function to add a clientId to the list, it will be added
  // to the state and the SharedPreferences, if it does not already exist in the list.
  Future<bool> addClientId(String clientId) async {

    // If the clientId is empty, return false
    if (state.contains(clientId)) {
      return false;
    }

    // Add the clientId to SharedPreferences
    await SharedPreferencesRepository.addRollingClientId(clientId);

    // Add the clientId to the list
    state = [...state, clientId];

    return true;
  }

  // Function to remove a clientId from the list, it will be removed
  // from the state and the SharedPreferences, if it exists in the list.
  Future<bool> removeClientId(BuildContext context, String clientId) async {

    // If the clientId is not in the list, return false
    if (!state.contains(clientId)) {
      return false;
    }

    // Remove the clientId from SharedPreferences
    await SharedPreferencesRepository.removeRollingClientId(clientId);

    // Remove the clientId from the list
    state = state.where((String loopedClientId) => loopedClientId != clientId).toList();

    // If the list is empty, disable the Rolling client mode
    if (state.isEmpty) {

      // Disable the Rolling client mode
      ref.read(rollingClientStatusProvider.notifier).changeStatus(context, false);

      // Show a SnackBar to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'You have removed the last Rolling client ID. The Rolling client mode has been disabled.',
          ),
        ),
      );

    }

    return true;
  }

  void reset() => state = <String>[];
}

/// Provider that exposes the value of the Stealth mode.
/// Default is true, to have 100% hiding capabilities to the staff
@Riverpod(keepAlive: true)
class StealthModeStatus extends _$StealthModeStatus {

  @override
  bool build() => true;

  void changeStatus(bool newValue) => state = newValue;
  void reset() => state = true;
}

/// Provider that exposes the value of the Rolling client.
@Riverpod(keepAlive: true)
class RollingClientStatus extends _$RollingClientStatus {

  @override
  bool build() => SharedPreferencesRepository
      .sharedPreferences
      .getBool(GlobalConstants.sharedPreferencesRollingClientKey) ?? false;

  Future<void> changeStatus(BuildContext context, bool newValue) async {

    // To enable rolling client mode, we need to ensure that there is
    // at least one rolling client ID in the list.
    if (newValue) {
      final List<String> rollingClientIds = SharedPreferencesRepository.retrieveRollingClientIds();
      if (rollingClientIds.isEmpty) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'You need to add at least one rolling client ID before enabling the Rolling client mode.',
            ),
          ),
        );
        return;
      }
    }

    await SharedPreferencesRepository.saveNewRollingClientValue(newValue);
    state = newValue;
  }

  void reset() => state = false;
}

/// Provider that exposes the fields that are used to generate the QR code
@Riverpod(keepAlive: true)
class GenerationFieldsStatus extends _$GenerationFieldsStatus {

  final Map<String, dynamic> initialState = {
    GlobalConstants.stateClientIdKey: SharedPreferencesFunctions.retrieveDynamicClientId(),
    GlobalConstants.stateCenterIdKey: SharedPreferencesFunctions.retrieveDynamicCenterId(),
    GlobalConstants.stateTokenKey: SharedPreferencesFunctions.retrieveDynamicToken(),
  };

  @override
  Map<String, dynamic> build() => initialState;

  void changeStatus(String key, dynamic newValue) => state = {
    ...state,
    key: newValue,
  };

  void setValues(Map<String, dynamic> newState) => state = {
    ...newState,
  };

  void reset() => state = initialState;

  void resetToEnvValues() => state = {
    GlobalConstants.stateClientIdKey: SharedPreferencesFunctions.retrieveEnvClientId(),
    GlobalConstants.stateCenterIdKey: SharedPreferencesFunctions.retrieveEnvCenterId(),
    GlobalConstants.stateTokenKey: SharedPreferencesFunctions.retrieveEnvToken(),
  };

}

/// Provider that exposes the map of ExpirationCheck models
/// clientId -> ResponseExpirationCheckModel
@Riverpod(keepAlive: true)
class ExpirationCheckMap extends _$ExpirationCheckMap {

  @override
  Map<int, DateTime> build() => {};

  void add(int clientId, DateTime expirationDate) {
    state = {
      ...state,
      clientId: expirationDate,
    };
  }

  void remove(int clientId) {
    final Map<int, DateTime> newState = {
      ...state
    }..remove(clientId);
    state = newState;
  }

  void reset() => state = {};
}