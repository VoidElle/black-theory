import 'package:black_theory/utils/shared_preferences_functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "global_providers.g.dart";

/// Provider that expose the value of the Stealth mode.
/// Default is true, to have 100% hiding capabilities to the staff
@Riverpod(keepAlive: true)
class StealthModeStatus extends _$StealthModeStatus {

  @override
  bool build() => true;

  void changeStatus(bool newValue) => state = newValue;
  void reset() => state = true;
}

@Riverpod(keepAlive: true)
class GenerationFieldsStatus extends _$GenerationFieldsStatus {

  final Map<String, dynamic> initialState = {
    'client_id': SharedPreferencesFunctions.retrieveDynamicClientId(),
    'center_id': SharedPreferencesFunctions.retrieveDynamicCenterId(),
    'token': SharedPreferencesFunctions.retrieveDynamicToken(),
  };

  @override
  Map<String, dynamic> build() => initialState;

  void changeStatus(String key, dynamic newValue) => state = {
    ...state,
    key: newValue,
  };

  void reset() => state = initialState;
}