import 'package:black_theory/providers/global_providers.dart';
import 'package:black_theory/utils/global_constants.dart';
import 'package:black_theory/utils/global_functions.dart';
import 'package:black_theory/widgets/actions/modify_fields_bottom_sheet.dart';
import 'package:black_theory/widgets/global_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/rolling_client_ids_page.dart';
import '../repositories/rest_clients_repository.dart';
import '../repositories/shared_preferences_repository.dart';
import '../utils/shared_preferences_functions.dart';
import 'global_quote.dart';

class GlobalDrawer extends StatelessWidget {

  const GlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: ColoredBox(
        color: Colors.black,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(context),
                          ..._buildItems(context),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Function to build the items
  List<Widget> _buildItems(BuildContext context) {
    return [

      Divider(
        color: Colors.white,
        thickness: 1.5,
      ),

      // Modify fields
      _wrapWithPadding(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return GestureDetector(
              onTapUp: (TapUpDetails _) async {

                // Handle new values if they are returned
                final Map<String, dynamic>? values = await GlobalFunctions.showBottomSheet(
                  context: context,
                  bottomSheet: ModifyFieldsBottomSheet(),
                );

                if (values != null && values.isNotEmpty) {
                  final String action = values['action'];
                  switch (action) {
                    case 'submit':
                      ref.read(generationFieldsStatusProvider.notifier).setValues(values);
                      await SharedPreferencesRepository.saveNewGenerationFields(values);

                      final int clientId = int.parse(values[GlobalConstants.stateClientIdKey]);
                      final String token = values[GlobalConstants.stateTokenKey];

                      // Retrieve the expiration date of the selected client id
                      RestClientsRepository.checkExpirationDateRestClient.checkExpirationDateOfClientId(clientId, token).then((String response) {
                        final DateTime expirationDate = GlobalFunctions.retrieveExpirationDateFromResponse(response);
                        ref.read(expirationCheckMapProvider.notifier).add(clientId, expirationDate);
                      });

                    case 'reset':
                      ref.read(generationFieldsStatusProvider.notifier).resetToEnvValues();
                      await SharedPreferencesRepository.resetGenerationFieldsToEnvs();

                      final int clientId = int.parse(SharedPreferencesFunctions.retrieveEnvClientId());
                      final String token = SharedPreferencesFunctions.retrieveEnvToken();

                      // Retrieve the expiration date of the selected client id
                      RestClientsRepository.checkExpirationDateRestClient.checkExpirationDateOfClientId(clientId, token).then((String response) {
                        final DateTime expirationDate = GlobalFunctions.retrieveExpirationDateFromResponse(response);
                        ref.read(expirationCheckMapProvider.notifier).add(clientId, expirationDate);
                      });

                  }
                }

                // Remove the bottom sheet
                Navigator.of(context).pop();

              },
              child: Row(
                spacing: 10,
                children: [

                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 30,
                  ),

                  Text(
                    "Modifica campi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            );
          }
        ),
      ),

      // Rolling Client IDs
      _wrapWithPadding(
        child: GestureDetector(
          onTapUp: (TapUpDetails _) {
            context.pushNamed(RollingClientIdsPage.route);
          },
          child: Row(
            spacing: 10,
            children: [

              Icon(
                Icons.casino,
                color: Colors.white,
                size: 30,
              ),

              Text(
                "Rolling client IDs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

            ],
          ),
        ),
      ),

      Divider(
        color: Colors.white,
        thickness: 1.5,
      ),

      // Stealth mode switch
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {

          final bool currentStealthModeStatus = ref.watch(stealthModeStatusProvider) ?? false;
          final Function(bool value) onSwitch = ref.read(stealthModeStatusProvider.notifier).changeStatus;

          return _wrapWithPadding(
            child: GlobalSwitch(
              text: "Stealth mode",
              switchValue: currentStealthModeStatus,
              onSwitch: onSwitch,
            ),
          );
        },
      ),

      // Rolling client switch
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {

          final bool rollingClientStatus = ref.watch(rollingClientStatusProvider) ?? false;
          final Function(bool value) onSwitch = ref.read(rollingClientStatusProvider.notifier).changeStatus;

          return _wrapWithPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: GlobalSwitch(
              text: "Rolling client",
              switchValue: rollingClientStatus,
              onSwitch: onSwitch,
            ),
          );
        },
      ),

      const Spacer(),

      _wrapWithPadding(
        child: GlobalQuote(
          padding: const EdgeInsets.symmetric(vertical: 25),
          opacity: .6,
          text: '“Corps\'ve long controlled our lives, taken lots... and now they\'re after our souls!”',
          author: '- Johnny Silverhand',
        ),
      ),

      _wrapWithPadding(
        child: const Text(
          'Version 1.0.0',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),

    ];
  }

  // Wraps the child with padding
  Widget _wrapWithPadding({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 7.5,
    ),
  }) {
    return Padding(
      padding: padding,
      child: child,
    );
  }

  // Builds the header of the drawer
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        IconButton(
          onPressed: () {
            Scaffold.of(context).closeDrawer();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),

        Text(
          "BlackTheory",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),

      ],
    );
  }
}
