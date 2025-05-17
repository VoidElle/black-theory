import 'package:black_theory/pages/qr_code_page.dart';
import 'package:black_theory/repositories/shared_preferences_repository.dart';
import 'package:black_theory/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {

  // Load environment variables from .env file
  await dotenv.load();

  // Initialize the Shared Preferences repository
  await SharedPreferencesRepository.initialize();

  runApp(
    ProviderScope(
      child: const BlackTheory(),
    ),
  );
}

class BlackTheory extends StatelessWidget {

  const BlackTheory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlackTheory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: GlobalColors.primaryNeonGreenColor,
        ),
      ),
      home: const QrCodePage(),
    );
  }
}