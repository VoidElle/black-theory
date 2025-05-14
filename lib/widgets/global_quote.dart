import 'package:flutter/material.dart';

class GlobalQuote extends StatelessWidget {

  const GlobalQuote({
    required this.text,
    required this.author,
    this.padding = EdgeInsets.zero,
    this.opacity = 1,
    super.key,
  });

  final String text;
  final String author;
  final EdgeInsets padding;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Opacity(
        opacity: opacity,
        child: Column(
          children: [

            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                author,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
