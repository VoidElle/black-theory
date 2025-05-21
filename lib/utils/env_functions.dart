import 'package:black_theory/utils/global_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvFunctions {

  // Function to retrieve the client id from the env variables
  static String retrieveClientId() {
    final String envKey = GlobalConstants.envClientIdKey;
    final String? clientId = dotenv.maybeGet(envKey, fallback: null);
    if (clientId == null) {
      throw Exception("$envKey not found in .env file");
    }
    return clientId;
  }

  // Function to retrieve the center id from the env variables
  static String retrieveCenterId() {
    final String envKey = GlobalConstants.envCenterIdKey;
    final String? centerId = dotenv.maybeGet(envKey, fallback: null);
    if (centerId == null) {
      throw Exception("$envKey not found in .env file");
    }
    return centerId;
  }

  // Function to retrieve the token from the env variables
  static String retrieveToken() {
    final String envKey = GlobalConstants.envTokenKey;
    final String? token = dotenv.maybeGet(envKey, fallback: null);
    if (token == null) {
      throw Exception("$envKey not found in .env file");
    }
    return token;
  }

  // Function to retrieve the base url from the env variables
  static String retrieveBaseUrl() {
    final String envKey = GlobalConstants.baseUrlKey;
    final String? baseUrl = dotenv.maybeGet(envKey, fallback: null);
    if (baseUrl == null) {
      throw Exception("$envKey not found in .env file");
    }
    return baseUrl;
  }

}