import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';
import '../screens/onboarding_screen.dart';

class ColorBlindThemes {
  static ThemeData getTheme(ColorBlindMode mode) {
    switch (mode) {
      case ColorBlindMode.normal:
        return _baseTheme(
          primary: const Color(0xFF5A4FB6),
          secondary: const Color(0xFF56B4E9),
          background: const Color(0xFFF8F9FB),
          surface: Colors.white,
        );
      case ColorBlindMode.protanopia:
        return _baseTheme(
          primary: const Color(0xFF0072B2),
          secondary: const Color(0xFFF0E442),
          background: const Color(0xFFF5F7FA),
          surface: Colors.white,
        );
      case ColorBlindMode.deuteranopia:
        return _baseTheme(
          primary: const Color(0xFF009E73),
          secondary: const Color(0xFFD55E00),
          background: const Color(0xFFF5F7FA),
          surface: Colors.white,
        );
      case ColorBlindMode.tritanopia:
        return _baseTheme(
          primary: const Color(0xFFCC79A7),
          secondary: const Color(0xFF0072B2),
          background: const Color(0xFFF5F7FA),
          surface: Colors.white,
        );
      default:
        return _baseTheme(
          primary: const Color(0xFF5A4FB6),
          secondary: const Color(0xFF56B4E9),
          background: const Color(0xFFF8F9FB),
          surface: Colors.white,
        );
    }
  }
}

ThemeData _baseTheme({
  required Color primary,
  required Color secondary,
  required Color background,
  required Color surface,
}) {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.white,
    secondary: secondary,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: background,
    onBackground: Colors.black,
    surface: surface,
    onSurface: Colors.black,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.inter(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
        side: BorderSide(color: primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary, width: 2),
      ),
      labelStyle: GoogleFonts.inter(color: primary, fontWeight: FontWeight.w500),
    ),
    textTheme: GoogleFonts.interTextTheme().apply(
      fontFamilyFallback: ['Noto Sans Symbols', 'Noto Sans Math'],
    ).copyWith(
      bodyLarge: GoogleFonts.inter(color: Colors.black, fontSize: 16),
      bodyMedium: GoogleFonts.inter(color: Colors.black87, fontSize: 14),
      labelLarge: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
      titleLarge: GoogleFonts.inter(color: primary, fontWeight: FontWeight.bold, fontSize: 22),
      titleMedium: GoogleFonts.inter(color: primary, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    cardColor: surface,
    dividerColor: primary.withOpacity(0.12),
    iconTheme: IconThemeData(color: primary),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: primary),
    tabBarTheme: TabBarTheme(
      labelColor: primary,
      unselectedLabelColor: Colors.black54,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primary, width: 2),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: primary,
      contentTextStyle: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: surface,
      textStyle: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.w500),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surface,
      selectedItemColor: primary,
      unselectedItemColor: Colors.black54,
      selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
      unselectedLabelStyle: GoogleFonts.inter(),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: surface,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: surface,
      titleTextStyle: GoogleFonts.inter(color: primary, fontWeight: FontWeight.bold, fontSize: 20),
      contentTextStyle: GoogleFonts.inter(color: Colors.black87, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(primary),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(primary),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(primary),
      trackColor: MaterialStateProperty.all(primary.withOpacity(0.3)),
    ),
    // Otros widgets pueden añadirse aquí para máxima cobertura
  );
}
