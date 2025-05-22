import 'package:flutter/material.dart';

import '../utils/global_colors.dart';

class GlobalNeonButton extends StatelessWidget {

  const GlobalNeonButton({
    required this.onPressed,
    required this.text,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
              color: GlobalColors.primaryNeonGreenColor.withValues(alpha: .5),
              spreadRadius: 7.5,
              blurRadius: 25,
              offset: const Offset(0, 0), // Centered glow
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalColors.primaryNeonGreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.5),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 55,
            ),
            elevation: 0, // Disable default directional shadow
            shadowColor: Colors.transparent, // Avoid conflict
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

}
