import 'package:black_theory/providers/global_providers.dart';
import 'package:black_theory/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

              _buildClientIdList(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClientIdList() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {

        final List<String> rollingClientIds = ref.watch(rollingClientIdsListProvider);

        if (rollingClientIds.isEmpty) {
          return Expanded(
            child: Center(
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.no_accounts,
                    color: Colors.white,
                    size: 55,
                  ),
                  Text(
                    'No Rolling Client IDs found\nAdd a new one using the button below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemCount: rollingClientIds.length,
            itemBuilder: (BuildContext context, int index) {
              final String clientId = rollingClientIds[index];
              return ListTile(
                title: Text(
                  clientId,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    final bool success = await ref.read(rollingClientIdsListProvider.notifier).removeClientId(context, clientId);
                    if (!success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'An error occurred while removing the client ID.',
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

}
