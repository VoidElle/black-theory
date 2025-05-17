import 'package:black_theory/utils/shared_preferences_functions.dart';
import 'package:flutter/material.dart';

class GlobalFunctions {

  // Function to retrieve QR code data
  static String retrieveQrCodeData() {

    // Retrieve client and center id
    final String clientId = SharedPreferencesFunctions.retrieveDynamicClientId();
    final String centerId = SharedPreferencesFunctions.retrieveDynamicCenterId();

    // Retrieve unix timestamp
    final int timestamp = DateTime.now().millisecondsSinceEpoch;

    return "client_id=$clientId&center_id=$centerId&time=$timestamp";
  }

  // Function to show a bottom sheet
  static Future<dynamic> showBottomSheet(BuildContext context, Widget bottomSheet) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return bottomSheet;
      },
    );
  }

}