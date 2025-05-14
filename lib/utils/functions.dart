import 'package:flutter_dotenv/flutter_dotenv.dart';

class Functions {

  // Function to retrieve QR code data
  static String retrieveQrCodeData() {

    // Retrieve the client ID from .env file
    final String? clientId = dotenv.maybeGet("CLIENT_ID", fallback: null);
    if (clientId == null) {
      throw Exception("CLIENT_ID not found in .env file");
    }

    // Retrieve center ID from .env file
    final String? centerId = dotenv.maybeGet("CENTER_ID", fallback: null);
    if (centerId == null) {
      throw Exception("CENTER_ID not found in .env file");
    }

    // Retrieve unix timestamp
    final int timestamp = DateTime.now().millisecondsSinceEpoch;

    return "client_id=$clientId&center_id=$centerId&time=$timestamp";
  }

}