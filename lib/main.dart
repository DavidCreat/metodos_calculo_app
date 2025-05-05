import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'theme/colorblind_themes.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBlindMode? _colorBlindMode;

  @override
  Widget build(BuildContext context) {
    if (_colorBlindMode == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(
          onFinish: (mode) => setState(() => _colorBlindMode = mode),
        ),
      );
    }
    return MaterialApp(
      title: 'Solucionador de Ecuaciones',
      debugShowCheckedModeBanner: false,
      theme: ColorBlindThemes.getTheme(_colorBlindMode!),
      home: const HomeScreen(),
    );
  }
}