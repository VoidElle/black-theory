import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalSwitch extends StatelessWidget {

  const GlobalSwitch({
    required this.text,
    required this.switchValue,
    required this.onSwitch,
    super.key,
  });

  final String text;
  final bool switchValue;
  final Function(bool value) onSwitch;

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

        CupertinoSwitch(
          value: switchValue,
          inactiveTrackColor: Colors.grey,
          onChanged: (bool value) {
            onSwitch(value);
          },
        ),

      ],
    );
  }

}
