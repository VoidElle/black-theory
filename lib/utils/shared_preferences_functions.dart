import 'package:black_theory/repositories/shared_preferences_repository.dart';
import 'package:black_theory/utils/env_functions.dart';
import 'package:black_theory/utils/global_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunctions {

  /// ----- START READ ----- ///

  // Function to retrieve the Client id from the shared preferences
  // If it is null, it will fallback to the env variables value
  static String retrieveDynamicClientId() {
    final SharedPreferences sharedPreferences = SharedPreferencesRepository.sharedPreferences;
    return sharedPreferences.getString(GlobalConstants.sharedPreferencesClientIdKey)
        ?? EnvFunctions.retrieveClientId();
  }

  // Function to retrieve the Center id from the shared preferences
  // If it is null, it will fallback to the env variables value
  static String retrieveDynamicCenterId() {
    final SharedPreferences sharedPreferences = SharedPreferencesRepository.sharedPreferences;
    return sharedPreferences.getString(GlobalConstants.sharedPreferencesCenterIdKey)
        ?? EnvFunctions.retrieveCenterId();
  }

  // Function to retrieve the Token from the shared preferences
  // If it is null, it will fallback to the env variables value
  static String retrieveDynamicToken() {
    final SharedPreferences sharedPreferences = SharedPreferencesRepository.sharedPreferences;
    return sharedPreferences.getString(GlobalConstants.sharedPreferencesTokenKey)
        ?? EnvFunctions.retrieveToken();
  }

  // Function to retrieve the Client id from the Env variables
  static String retrieveEnvClientId() {
    return EnvFunctions.retrieveClientId();
  }

  // Function to retrieve the Center id from the Env variables
  static String retrieveEnvCenterId() {
    return EnvFunctions.retrieveCenterId();
  }

  // Function to retrieve the Token from the Env variables
  static String retrieveEnvToken() {
    return EnvFunctions.retrieveToken();
  }

  /// ----- END READ ----- ///

  /// ----- START WRITE ----- ///

  // Function to save the Client id to the shared preferences
  static Future<bool> saveDynamicClientId(String value) async {
    final SharedPreferences sharedPreferences = SharedPreferencesRepository.sharedPreferences;
    return await sharedPreferences.setString(GlobalConstants.sharedPreferencesClientIdKey, value);
  }

  // Function to save the Center id to the shared preferences
  static Future<bool> saveDynamicCenterId(String value) async {
    final SharedPreferences sharedPreferences = SharedPreferencesRepository.sharedPreferences;
    return await sharedPreferences.setString(GlobalConstants.sharedPreferencesCenterIdKey, value);
  }

  // Function to save the Token to the shared preferences
  static Future<bool> saveDynamicToken(String value) async {
    final SharedPreferences sharedPreferences = SharedPreferencesRepository.sharedPreferences;
    return await sharedPreferences.setString(GlobalConstants.sharedPreferencesTokenKey, value);
  }

  /// ----- END WRITE ----- ///

}