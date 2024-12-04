import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Enumeração de temas de texto do aplicativo.
enum AppTextTheme {
  bodyLarge,
  bodyMedium,
  bodySmall,
  displayLarge,
  displayMedium,
  displaySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  hint,
}

extension AppTextThemeExtension on AppTextTheme {
  TextStyle get style {
    switch (this) {
      case AppTextTheme.bodyLarge:
        return TextStyle(
          fontSize: 16.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.bodyMedium:
        return TextStyle(
          fontSize: 14.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.bodySmall:
        return TextStyle(
          fontSize: 12.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.displayLarge:
        return TextStyle(
          fontSize: 32.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.displayMedium:
        return TextStyle(
          fontSize: 24.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.displaySmall:
        return TextStyle(
          fontSize: 20.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.labelLarge:
        return TextStyle(
          fontSize: 16.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.labelMedium:
        return TextStyle(
          fontSize: 14.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.labelSmall:
        return TextStyle(
          fontSize: 12.0,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.headlineLarge:
        return TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.headlineMedium:
        return TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.headlineSmall:
        return TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.titleLarge:
        return TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.titleMedium:
        return TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.titleSmall:
        return TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
      case AppTextTheme.hint:
        return TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
          fontStyle: FontStyle.italic,
          fontFamily: GoogleFonts.nunito().fontFamily,
        );
    }
  }
}
