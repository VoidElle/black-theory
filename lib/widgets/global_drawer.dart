import 'package:black_theory/widgets/global_switch.dart';
import 'package:flutter/material.dart';

import '../repositories/shared_preferences_repository.dart';
import '../utils/global_constants.dart';
import 'global_quote.dart';

class GlobalDrawer extends StatefulWidget {

  const GlobalDrawer({super.key});

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {

  late bool _stealthMode;

  @override
  void initState() {
    _stealthMode = SharedPreferencesRepository.sharedPreferences.getBool(GlobalConstants.sharedPreferencesStealthModeKey) ?? GlobalConstants.sharedPreferencesStealthModeDefaultValue;
    super.initState();
  }

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
                          ..._buildItems(),
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
  List<Widget> _buildItems() {
    return [

      Divider(
        color: Colors.white,
        thickness: 1.5,
      ),

      // Find client_id
      _wrapWithPadding(
        child: Row(
          spacing: 10,
          children: [

            Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 30,
            ),

            Text(
              "Ricerca Client ID",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),

          ],
        ),
      ),

      // Modify fields
      _wrapWithPadding(
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
      ),

      Divider(
        color: Colors.white,
        thickness: 1.5,
      ),

      _wrapWithPadding(
        child: GlobalSwitch(
          text: "Stealth mode",
          switchValue: _stealthMode,
          voidCallback: () {},
        ),
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7.5,
      ),
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
