import 'package:black_theory/widgets/global_switch.dart';
import 'package:flutter/material.dart';

import 'global_quote.dart';

class GlobalDrawer extends StatelessWidget {

  const GlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: ColoredBox(
        color: const Color(0xFF000000),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          _buildHeader(context),

                          _wrapWithPadding(
                            child: GlobalSwitch(
                              text: "Shadow mode",
                              switchValue: false,
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

  Widget _wrapWithPadding({
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: child,
    );
  }

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

      ],
    );
  }

}
