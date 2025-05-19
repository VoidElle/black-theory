import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/global_providers.dart';
import '../../repositories/shared_preferences_repository.dart';
import '../../utils/global_constants.dart';

class ModifyFieldsBottomSheet extends ConsumerStatefulWidget {

  const ModifyFieldsBottomSheet({super.key});

  @override
  ConsumerState<ModifyFieldsBottomSheet> createState() => _ModifyFieldsBottomSheetState();
}

class _ModifyFieldsBottomSheetState extends ConsumerState<ModifyFieldsBottomSheet> {

  late TextEditingController _clientIdTextEditingController;
  late TextEditingController _centerIdTextEditingController;
  late TextEditingController _tokenTextEditingController;

  @override
  void initState() {

    final Map<String, dynamic> generationFieldStatusProviderState = ref.read(generationFieldsStatusProvider);

    _clientIdTextEditingController = TextEditingController();
    _clientIdTextEditingController.text = generationFieldStatusProviderState[GlobalConstants.stateClientIdKey];

    _centerIdTextEditingController = TextEditingController();
    _centerIdTextEditingController.text = generationFieldStatusProviderState[GlobalConstants.stateCenterIdKey];

    _tokenTextEditingController = TextEditingController();
    _tokenTextEditingController.text = generationFieldStatusProviderState[GlobalConstants.stateTokenKey];

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
            controller: _clientIdTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Client ID',
            ),
          ),

          const SizedBox(height: 12),

          // Input 2
          TextField(
            controller: _centerIdTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Center ID',
            ),
          )
          ,
          const SizedBox(height: 12),

          // Input 3
          TextField(
            controller: _tokenTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Token',
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
                  child: const Text('Cancel'),
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
                      GlobalConstants.stateClientIdKey: _clientIdTextEditingController.text,
                      GlobalConstants.stateCenterIdKey: _centerIdTextEditingController.text,
                      GlobalConstants.stateTokenKey: _tokenTextEditingController.text,
                    };

                    // Save the new fields
                    await SharedPreferencesRepository.saveNewGenerationFields(result);

                    // Close the bottom sheet
                    Navigator.of(context).pop(result);

                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),


          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop({
                      'action': 'reset',
                    });
                  },
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

        ],
      ),
    );
  }
}
