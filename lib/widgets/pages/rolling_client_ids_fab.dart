import 'package:black_theory/widgets/actions/add_rolling_client_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../utils/global_constants.dart';
import '../../utils/global_functions.dart';

class RollingClientIdsFab extends StatelessWidget {

  const RollingClientIdsFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {

        // Show the bottom sheet to add a new rolling client id
        final Map<String, dynamic>? values = await GlobalFunctions.showBottomSheet(
          context: context,
          bottomSheet: AddRollingClientBottomSheet(),
        );

        // If the user did not add a client id, return
        if (values == null) {
          return;
        }

        final String clientIdToAdd = values[GlobalConstants.actionAddRollingClientId];

        // If the client id is empty, return
        if (clientIdToAdd.isEmpty) {
          return;
        }

        // Add the client id to the list of rolling client ids


      },
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }

}
