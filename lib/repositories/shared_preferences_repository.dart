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

}