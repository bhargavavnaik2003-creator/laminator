import 'package:flutter/material.dart';
import 'style_constants.dart';

/// Brand theme for the Merino kiosk application.
/// Use [appTheme] in [MaterialApp.theme].
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    // ── Brand colour ── replace with actual hex from brand guide
    seedColor: const Color(0xFF2C3E50),
    brightness: Brightness.dark,
    surface: const Color(0xFF1A1D23),
    onSurface: const Color(0xFFF0F0F0),
  ),
  scaffoldBackgroundColor: const Color(0xFF1A1D23),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      fontSize: 36,
      letterSpacing: -0.5,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 11,
      letterSpacing: 1.2,
    ),
  ),
  cardTheme: CardThemeData(
    elevation: StyleConstants.elevationMid,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(StyleConstants.radiusMd),
    ),
    color: const Color(0xFF252930),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1D23),
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Color(0xFFF0F0F0),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2C3E50),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(StyleConstants.radiusSm),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: StyleConstants.spaceLg,
        vertical: StyleConstants.spaceMd,
      ),
    ),
  ),
);
