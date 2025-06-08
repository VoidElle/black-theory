import 'package:black_theory/widgets/actions/add_rolling_client_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';

class RollingClientIdsFab extends StatelessWidget {

  const RollingClientIdsFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {

        final Map<String, dynamic>? values = await GlobalFunctions.showBottomSheet(
          context: context,
          bottomSheet: AddRollingClientBottomSheet(),
        );

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
