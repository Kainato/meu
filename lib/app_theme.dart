import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';

/// Esta classe é responsável por definir o tema do aplicativo. Ela é utilizada
/// no arquivo `lib/app_widget.dart` para definir o tema do aplicativo baseada
/// no tema do sistema ou no tema definido pelo usuário.
class AppTheme {
  const AppTheme();

  /// Retorna o tema baseado no esquema de cores.
  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        cardTheme: CardTheme(
          color: colorScheme.surfaceContainer,
          shadowColor: colorScheme.shadow,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor:
                WidgetStateProperty.all(colorScheme.surfaceContainerLow),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme.outline,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          textStyle: AppTextTheme.titleMedium.style.copyWith(
            color: colorScheme.secondary,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.surfaceContainerLow,
            textStyle: AppTextTheme.titleMedium.style.copyWith(
              color: colorScheme.secondary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );

  /// Retorna o tema escuro.
  ThemeData dark() => theme(AppThemeMode.dark.colorScheme);

  /// Retorna o tema claro.
  ThemeData light() => theme(AppThemeMode.light.colorScheme);
}

enum AppThemeMode { system, light, dark }

extension AppThemeModeExtension on AppThemeMode {
  ColorScheme get colorScheme {
    switch (this) {
      case AppThemeMode.dark:
        return const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xff88d1ec),
          surfaceTint: Color(0xff88d1ec),
          onPrimary: Color(0xff003543),
          primaryContainer: Color(0xff004e61),
          onPrimaryContainer: Color(0xffb7eaff),
          secondary: Color(0xffb3cad4),
          onSecondary: Color(0xff1e333b),
          secondaryContainer: Color(0xff344a52),
          onSecondaryContainer: Color(0xffcfe6f1),
          tertiary: Color(0xffc1cd7d),
          onTertiary: Color(0xff2c3400),
          tertiaryContainer: Color(0xff414b07),
          onTertiaryContainer: Color(0xffddea96),
          error: Color(0xffffb4ab),
          onError: Color(0xff690005),
          errorContainer: Color(0xff93000a),
          onErrorContainer: Color(0xffffdad6),
          surface: Color(0xff0f1416),
          onSurface: Color(0xffdee3e6),
          onSurfaceVariant: Color(0xffbfc8cc),
          outline: Color(0xff8a9296),
          outlineVariant: Color(0xff40484c),
          shadow: Color(0xff000000),
          scrim: Color(0xff000000),
          inverseSurface: Color(0xffdee3e6),
          inversePrimary: Color(0xff07677f),
          primaryFixed: Color(0xffb7eaff),
          onPrimaryFixed: Color(0xff001f28),
          primaryFixedDim: Color(0xff88d1ec),
          onPrimaryFixedVariant: Color(0xff004e61),
          secondaryFixed: Color(0xffcfe6f1),
          onSecondaryFixed: Color(0xff071e26),
          secondaryFixedDim: Color(0xffb3cad4),
          onSecondaryFixedVariant: Color(0xff344a52),
          tertiaryFixed: Color(0xffddea96),
          onTertiaryFixed: Color(0xff191e00),
          tertiaryFixedDim: Color(0xffc1cd7d),
          onTertiaryFixedVariant: Color(0xff414b07),
          surfaceDim: Color(0xff0f1416),
          surfaceBright: Color(0xff353a3c),
          surfaceContainerLowest: Color(0xff0a0f11),
          surfaceContainerLow: Color(0xff171c1f),
          surfaceContainer: Color(0xff1b2023),
          surfaceContainerHigh: Color(0xff252b2d),
          surfaceContainerHighest: Color(0xff303638),
        );
      default:
        return const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff07677f),
          surfaceTint: Color(0xff07677f),
          onPrimary: Color(0xffffffff),
          primaryContainer: Color(0xffb7eaff),
          onPrimaryContainer: Color(0xff001f28),
          secondary: Color(0xff4c626a),
          onSecondary: Color(0xffffffff),
          secondaryContainer: Color(0xffcfe6f1),
          onSecondaryContainer: Color(0xff071e26),
          tertiary: Color(0xff596420),
          onTertiary: Color(0xffffffff),
          tertiaryContainer: Color(0xffddea96),
          onTertiaryContainer: Color(0xff191e00),
          error: Color(0xffba1a1a),
          onError: Color(0xffffffff),
          errorContainer: Color(0xffffdad6),
          onErrorContainer: Color(0xff410002),
          surface: Color(0xfff5fafd),
          onSurface: Color(0xff171c1f),
          onSurfaceVariant: Color(0xff40484c),
          outline: Color(0xff70787c),
          outlineVariant: Color(0xffbfc8cc),
          shadow: Color(0xff000000),
          scrim: Color(0xff000000),
          inverseSurface: Color(0xff2c3134),
          inversePrimary: Color(0xff88d1ec),
          primaryFixed: Color(0xffb7eaff),
          onPrimaryFixed: Color(0xff001f28),
          primaryFixedDim: Color(0xff88d1ec),
          onPrimaryFixedVariant: Color(0xff004e61),
          secondaryFixed: Color(0xffcfe6f1),
          onSecondaryFixed: Color(0xff071e26),
          secondaryFixedDim: Color(0xffb3cad4),
          onSecondaryFixedVariant: Color(0xff344a52),
          tertiaryFixed: Color(0xffddea96),
          onTertiaryFixed: Color(0xff191e00),
          tertiaryFixedDim: Color(0xffc1cd7d),
          onTertiaryFixedVariant: Color(0xff414b07),
          surfaceDim: Color(0xffd6dbde),
          surfaceBright: Color(0xfff5fafd),
          surfaceContainerLowest: Color(0xffffffff),
          surfaceContainerLow: Color(0xffeff4f7),
          surfaceContainer: Color(0xffeaeff1),
          surfaceContainerHigh: Color(0xffe4e9ec),
          surfaceContainerHighest: Color(0xffdee3e6),
        );
    }
  }
}
