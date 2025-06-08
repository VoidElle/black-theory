import 'package:black_theory/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/pages/rolling_client_ids_fab.dart';

class RollingClientIdsPage extends StatefulWidget {

  const RollingClientIdsPage({super.key});

  static const String route = '/rolling-client-ids-page';

  @override
  State<RollingClientIdsPage> createState() => _RollingClientIdsPageState();
}

class _RollingClientIdsPageState extends State<RollingClientIdsPage> {

  // Device sizes
  double? _deviceHeight;
  double? _deviceWidth;

  @override
  Widget build(BuildContext context) {

    // Initialize device sizes
    // (Cannot be done in initState because of context)
    if (_deviceHeight == null || _deviceWidth == null) {
      final Size deviceSize = MediaQuery.of(context).size;
      _deviceHeight = deviceSize.height;
      _deviceWidth = deviceSize.width;
    }

    return Scaffold(
      floatingActionButton: RollingClientIdsFab(),
      backgroundColor: GlobalColors.backgroundBlackColor,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Back button
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.pop();
                },
              ),

              Center(
                child: Text(
                  'Rolling Client IDs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
