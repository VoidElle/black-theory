import 'package:flutter/material.dart';

class GlobalSwitch extends StatelessWidget {

  const GlobalSwitch({
    required this.text,
    required this.switchValue,
    required this.voidCallback,
    super.key,
  });

  final String text;
  final bool switchValue;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Calibri',
            color: Colors.white,
            height: 1,
            fontSize: 18,
          ),
        ),

        const Spacer(),

        Switch(
          value: switchValue,
          onChanged: (value) {
            voidCallback();
          },
          activeColor: Colors.green,
          inactiveThumbColor: Colors.red,
        ),

      ],
    );
  }

}
