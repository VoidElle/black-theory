import 'package:flutter/material.dart';

class ModifyFieldsBottomSheet extends StatelessWidget {

  const ModifyFieldsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();

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
            controller: controller1,
            decoration: const InputDecoration(
              labelText: 'Client ID',
            ),
          ),

          const SizedBox(height: 12),

          // Input 2
          TextField(
            controller: controller2,
            decoration: const InputDecoration(
              labelText: 'Center ID',
            ),
          )
          ,
          const SizedBox(height: 12),

          // Input 3
          TextField(
            controller: controller3,
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
                    Navigator.pop(context); // dismiss without return
                  },
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              // Submit button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Collect values
                    final result = {
                      'input1': controller1.text,
                      'input2': controller2.text,
                      'input3': controller3.text,
                    };
                    Navigator.pop(context, result); // return values
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
                    Navigator.pop(context); // dismiss without return
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
