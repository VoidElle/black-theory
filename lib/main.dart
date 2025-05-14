import 'package:black_theory/pages/qr_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {

  // Load environment variables from .env file
  await dotenv.load();

  runApp(
    const BlackTheory(),
  );
}

class BlackTheory extends StatelessWidget {

  const BlackTheory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlackTheory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const QrCodePage(),
    );
  }

}