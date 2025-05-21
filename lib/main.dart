import 'package:black_theory/repositories/shared_preferences_repository.dart';
import 'package:black_theory/utils/global_colors.dart';
import 'package:black_theory/utils/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {

  // Ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env file
  await dotenv.load();

  // Initialize the Shared Preferences repository
  await SharedPreferencesRepository.initialize();

  /// Set the orientation to portrait
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Set the system UI overlay
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

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
    return MaterialApp.router(
      routerConfig: GlobalFunctions.appRouter,
      title: 'BlackTheory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: GlobalColors.primaryNeonGreenColor,
        ),
      ),
    );
  }
}