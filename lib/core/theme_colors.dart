import 'package:flutter/material.dart';

class ThemeColors {
  static late ThemeData _themeData;

  // Inicializa o ThemeColors com o ThemeData
  static void init(ThemeData themeData) {
    _themeData = themeData;
  }

  static Color get primary => _themeData.colorScheme.primary;
  static Color get surfaceTint => _themeData.colorScheme.surfaceTint;
  static Color get onPrimary => _themeData.colorScheme.onPrimary;
  static Color get primaryContainer => _themeData.colorScheme.primaryContainer;
  static Color get onPrimaryContainer => _themeData.colorScheme.onPrimaryContainer;
  static Color get secondary => _themeData.colorScheme.secondary;
  static Color get onSecondary => _themeData.colorScheme.onSecondary;
  static Color get secondaryContainer => _themeData.colorScheme.secondaryContainer;
  static Color get onSecondaryContainer => _themeData.colorScheme.onSecondaryContainer;
  static Color get tertiary => _themeData.colorScheme.tertiary;
  static Color get onTertiary => _themeData.colorScheme.onTertiary;
  static Color get tertiaryContainer => _themeData.colorScheme.tertiaryContainer;
  static Color get onTertiaryContainer => _themeData.colorScheme.onTertiaryContainer;
  static Color get error => _themeData.colorScheme.error;
  static Color get onError => _themeData.colorScheme.onError;
  static Color get errorContainer => _themeData.colorScheme.errorContainer;
  static Color get onErrorContainer => _themeData.colorScheme.onErrorContainer;
  static Color get surface => _themeData.colorScheme.surface;
  static Color get onSurface => _themeData.colorScheme.onSurface;
  static Color get onSurfaceVariant => _themeData.colorScheme.onSurfaceVariant;
  static Color get onInverseSurface => _themeData.colorScheme.onInverseSurface;
  static Color get outline => _themeData.colorScheme.outline;
  static Color get outlineVariant => _themeData.colorScheme.outlineVariant;
  static Color get shadow => _themeData.colorScheme.shadow;
  static Color get scrim => _themeData.colorScheme.scrim;
  static Color get inverseSurface => _themeData.colorScheme.inverseSurface;
  static Color get inversePrimary => _themeData.colorScheme.inversePrimary;
  static Color get primaryFixed => _themeData.colorScheme.primaryFixed;
  static Color get onPrimaryFixed => _themeData.colorScheme.onPrimaryFixed;
  static Color get primaryFixedDim => _themeData.colorScheme.primaryFixedDim;
  static Color get onPrimaryFixedVariant => _themeData.colorScheme.onPrimaryFixedVariant;
  static Color get secondaryFixed => _themeData.colorScheme.secondaryFixed;
  static Color get onSecondaryFixed => _themeData.colorScheme.onSecondaryFixed;
  static Color get secondaryFixedDim => _themeData.colorScheme.secondaryFixedDim;
  static Color get onSecondaryFixedVariant => _themeData.colorScheme.onSecondaryFixedVariant;
  static Color get tertiaryFixed => _themeData.colorScheme.tertiaryFixed;
  static Color get onTertiaryFixed => _themeData.colorScheme.onTertiaryFixed;
  static Color get tertiaryFixedDim => _themeData.colorScheme.tertiaryFixedDim;
  static Color get onTertiaryFixedVariant => _themeData.colorScheme.onTertiaryFixedVariant;
  static Color get surfaceDim => _themeData.colorScheme.surfaceDim;
  static Color get surfaceBright => _themeData.colorScheme.surfaceBright;
  static Color get surfaceContainerLowest => _themeData.colorScheme.surfaceContainerLowest;
  static Color get surfaceContainerLow => _themeData.colorScheme.surfaceContainerLow;
  static Color get surfaceContainer => _themeData.colorScheme.surfaceContainer;
  static Color get surfaceContainerHigh => _themeData.colorScheme.surfaceContainerHigh;
  static Color get surfaceContainerHighest => _themeData.colorScheme.surfaceContainerHighest;
}
