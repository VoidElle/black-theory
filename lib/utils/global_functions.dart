import 'package:black_theory/utils/global_constants.dart';
import 'package:flutter/material.dart';

class GlobalFunctions {

  // Function to retrieve QR code data
  static String retrieveQrCodeData(Map<String, dynamic> generationFields) {

    // Retrieve client and center id
    final String clientId = generationFields[GlobalConstants.stateClientIdKey];
    final String centerId = generationFields[GlobalConstants.stateCenterIdKey];

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