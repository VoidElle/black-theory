class GlobalConstants {

  // Stealth mode
  static const String sharedPreferencesStealthModeKey = "STEALTH_MODE";
  static const bool sharedPreferencesStealthModeDefaultValue = true;

  // Env variable keys
  static const String envClientIdKey = "CLIENT_ID";
  static const String envCenterIdKey = "CENTER_ID";
  static const String envTokenKey = "TOKEN";
  static const String baseUrlKey = "BASE_URL";

  // SharedPreferences keys
  static const String sharedPreferencesClientIdKey = "CLIENT_ID";
  static const String sharedPreferencesCenterIdKey = "CENTER_ID";
  static const String sharedPreferencesTokenKey = "TOKEN";

  // State keys
  static const String stateClientIdKey = "CLIENT_ID";
  static const String stateCenterIdKey = "CENTER_ID";
  static const String stateTokenKey = "TOKEN";

  // Check expiration headers
  static const Map<String, String> headers = <String, String>{
    'user-agent': 'Dart/3.6 (dart:io)',
    'content-type': 'application/x-www-form-urlencoded; charset=utf-8',
    'accept-encoding': 'gzip',
    'host': 'gym.theoryholding.com',
    'content-length': '54',
  };

}