import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddRollingClientBottomSheet extends ConsumerStatefulWidget {

  const AddRollingClientBottomSheet({super.key});

  @override
  ConsumerState<AddRollingClientBottomSheet> createState() => _AddRollingClientBottomSheetState();
}

class _AddRollingClientBottomSheetState extends ConsumerState<AddRollingClientBottomSheet> {

  late TextEditingController _newRollingClientIdTextEditingController;

  @override
  void initState() {
    _newRollingClientIdTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // Input 1
          TextField(
            controller: _newRollingClientIdTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Client ID',
            ),
          ),

          const SizedBox(height: 24),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Cancel button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Annulla'),
                ),
              ),
              const SizedBox(width: 12),
              // Submit button
              Expanded(
                child: OutlinedButton(
                  onPressed: () async {

                    // Retrieve the result
                    final Map<String, dynamic> result = {
                      'action': 'submit',
                    };

                    // Close the bottom sheet
                    context.pop(result);

                  },
                  child: const Text('Aggiungi'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

        ],
      ),
    );
  }
}
