import 'package:black_theory/utils/env_functions.dart';
import 'package:black_theory/utils/global_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {

  static SharedPreferences? _sharedPreferences;

  // Function to retrieve the instance of the SharedPreferences repository
  static Future<void> initialize() async {
    if (_sharedPreferences != null) {
      return;
    }
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Function to retrieve the SharedPreferences instance
  static SharedPreferences get sharedPreferences {
   if (_sharedPreferences == null) {
     throw Exception("SharedPreferences is not initialized! Call SharedPreferencesRepository.initialize() before!");
   }
   return _sharedPreferences!;
  }

  // Save - Generating fields
  static Future<bool> saveNewGenerationFields(Map<String, dynamic> generationFields) async {

    if (_sharedPreferences == null) {
      throw Exception("SharedPreferences is not initialized! Call SharedPreferencesRepository.initialize() before!");
    }

    final String newClientId = generationFields[GlobalConstants.stateClientIdKey];
    final bool clientIdSavedSuccessfully = await _sharedPreferences!
        .setString(GlobalConstants.sharedPreferencesClientIdKey, newClientId);

    final String newCenterId = generationFields[GlobalConstants.stateCenterIdKey];
    final bool centerIdSavedSuccessfully = await _sharedPreferences!
        .setString(GlobalConstants.sharedPreferencesCenterIdKey, newCenterId);

    final String newToken = generationFields[GlobalConstants.stateTokenKey];
    final bool tokenSavedSuccessfully = await _sharedPreferences!
        .setString(GlobalConstants.sharedPreferencesTokenKey, newToken);

    return clientIdSavedSuccessfully && centerIdSavedSuccessfully && tokenSavedSuccessfully;
  }

  // Save - Rolling client
  static Future<bool> saveNewRollingClientValue(bool newValue) async {

    if (_sharedPreferences == null) {
      throw Exception("SharedPreferences is not initialized! Call SharedPreferencesRepository.initialize() before!");
    }

    final bool newValueSavedSuccessfully = await _sharedPreferences!
        .setBool(GlobalConstants.sharedPreferencesRollingClientKey, newValue);

    return newValueSavedSuccessfully;
  }

  // Reset - Generating fields
  static Future<bool> resetGenerationFieldsToEnvs() async {

    if (_sharedPreferences == null) {
      throw Exception("SharedPreferences is not initialized! Call SharedPreferencesRepository.initialize() before!");
    }

    final String envClientId = EnvFunctions.retrieveClientId();
    final bool clientIdSavedSuccessfully = await _sharedPreferences!
        .setString(GlobalConstants.sharedPreferencesClientIdKey, envClientId);

    final String envCenterId = EnvFunctions.retrieveCenterId();
    final bool centerIdSavedSuccessfully = await _sharedPreferences!
        .setString(GlobalConstants.sharedPreferencesCenterIdKey, envCenterId);

    final String envToken = EnvFunctions.retrieveToken();
    final bool tokenSavedSuccessfully = await _sharedPreferences!
        .setString(GlobalConstants.sharedPreferencesTokenKey, envToken);

    return clientIdSavedSuccessfully && centerIdSavedSuccessfully && tokenSavedSuccessfully;
  }

  // Retrieve - Rolling client IDs
  static List<String> retrieveRollingClientIds() {
    if (_sharedPreferences == null) {
      throw Exception("SharedPreferences is not initialized! Call SharedPreferencesRepository.initialize() before!");
    }
    return _sharedPreferences!.getStringList(GlobalConstants.sharedPreferencesRollingClientIdsListKey) ?? <String>[];
  }

  // Add - Rolling client ID
  static Future<bool> addRollingClientId(String clientId) async {

    // Ensure SharedPreferences is initialized
    if (_sharedPreferences == null) {
      throw Exception("SharedPreferences is not initialized! Call SharedPreferencesRepository.initialize() before!");
    }

    // Check if the clientId is already in the list
    final List<String> currentIds = retrieveRollingClientIds();
    if (currentIds.contains(clientId)) {
      return false;
    }

    // Add the clientId to the list
    currentIds.add(clientId);

    // Save the updated list to SharedPreferences
    return await _sharedPreferences!.setStringList(GlobalConstants.sharedPreferencesRollingClientIdsListKey, currentIds);
  }

  // Remove - Rolling client ID
  static Future<bool> removeRollingClientId(String clientId) async {

    // Ensure SharedPreferences is initialized
    if (_sharedPreferences == null) {
      throw Exception("SharedPreferences is not initialized! Call SharedPreferencesRepository.initialize() before!");
    }

    // Check if the clientId is in the list
    final List<String> currentIds = retrieveRollingClientIds();
    if (!currentIds.contains(clientId)) {
      return false;
    }

    // Remove the clientId from the list
    currentIds.remove(clientId);

    // Save the updated list to SharedPreferences
    return await _sharedPreferences!.setStringList(GlobalConstants.sharedPreferencesRollingClientIdsListKey, currentIds);
  }

}