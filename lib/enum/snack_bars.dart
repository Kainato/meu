import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/theme_colors.dart';

/// `SnackBar` é um enum que representa os tipos de SnackBar disponíveis no aplicativo.
/// Você pode acessar o SnackBar com a propriedade `getSnackBar` e passando o contexto e a mensagem.
///
/// ```dart
/// ScaffoldMessenger.of(context).showSnackBar(
///   SnackBars.info.getSnackBar(
///     context,
///     'Insira a sua mensagem aqui!',
///   );
/// );
/// ```
enum SnackBars {
  alert,
  success,
  error,
  info,
}

extension SnackBarsExtension on SnackBars {
  SnackBar getSnackBar(BuildContext context, String message) {
    switch (this) {
      case SnackBars.alert:
        return SnackBar(
          content: Text(
            message,
            style: AppTextTheme.titleSmall.style.copyWith(
              color: ThemeColors.onErrorContainer,
            ),
          ),
          backgroundColor: ThemeColors.errorContainer,
        );
      case SnackBars.success:
        return SnackBar(
          content: Text(
            message,
            style: AppTextTheme.titleSmall.style.copyWith(
              color: ThemeColors.onTertiaryContainer,
            ),
          ),
          backgroundColor: ThemeColors.tertiaryContainer,
        );
      case SnackBars.error:
        return SnackBar(
          content: Text(
            message,
            style: AppTextTheme.titleSmall.style.copyWith(
              color: ThemeColors.onError,
            ),
          ),
          backgroundColor: ThemeColors.error,
        );
      case SnackBars.info:
        return SnackBar(
          content: Text(
            message,
            style: AppTextTheme.titleSmall.style.copyWith(
              color: ThemeColors.onInverseSurface,
            ),
          ),
          backgroundColor: ThemeColors.inverseSurface,
        );
    }
  }
}
