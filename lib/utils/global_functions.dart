import 'package:black_theory/providers/global_providers.dart';
import 'package:black_theory/utils/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalFunctions {

  // Function to retrieve QR code data
  static String retrieveQrCodeData(WidgetRef ref) {

    // Retrieve client and center id
    final Map<String, dynamic> generationFieldStatusProviderState = ref.read(generationFieldsStatusProvider);
    final String clientId = generationFieldStatusProviderState[GlobalConstants.stateClientIdKey];
    final String centerId = generationFieldStatusProviderState[GlobalConstants.stateCenterIdKey];

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