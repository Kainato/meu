import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/enum/standard_styles.dart';
import 'package:myapp/core/theme_colors.dart';

class StandardElevatedButton extends StatelessWidget {
  /// Texto a ser exibido no botão. Ele foi estilizado com a fonte [AppTextTheme.labelMedium].
  final String label;

  /// Ícone a ser exibido no botão. Ele foi estilizado com a cor do texto.
  final IconData? icon;

  /// Função a ser executada ao pressionar o botão. Pode ser tanto uma função anônima
  /// quanto uma função nomeada ou até mesmo uma função de callback e/ou assíncrona.
  final void Function() onPressed;

  /// Estilo do botão. Recebe um dos valores da enum [StandardStyles].
  final StandardStyles style;

  /// Este widget é um botão elevado padronizado com o design do projeto.
  ///
  /// ### Parâmetros
  /// - [label]: Texto a ser exibido no botão.
  /// - [icon]: Ícone a ser exibido no botão.
  /// - [onPressed]: Função a ser executada ao pressionar o botão.
  /// - [style]: Estilo do botão.
  const StandardElevatedButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.style = StandardStyles.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: _decoration(context, style: style),
      label: Text(
        label,
        style: _textStyle(context, style: style),
      ),
      icon: icon != null
          ? Icon(icon, color: _textStyle(context, style: style).color)
          : null,
    );
  }
}

ButtonStyle _decoration(BuildContext context, {required StandardStyles style}) {
  switch (style) {
    case StandardStyles.primary:
      return ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.primary,
      );
    case StandardStyles.low:
      return ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.surfaceContainerLow,
      );
    case StandardStyles.outlined:
      return ElevatedButton.styleFrom(
        side: BorderSide(color: ThemeColors.inverseSurface),
      );
    case StandardStyles.transparent:
      return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, elevation: 0);
    case StandardStyles.elevated:
      return ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 4,
      );
    case StandardStyles.error:
      return ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.error,
      );

    case StandardStyles.cancel:
      return ElevatedButton.styleFrom(
        side: BorderSide(color: ThemeColors.error),
      );
  }
}

TextStyle _textStyle(BuildContext context, {required StandardStyles style}) {
  switch (style) {
    case StandardStyles.primary:
      return AppTextTheme.labelMedium.style.copyWith(
        color: ThemeColors.onPrimary,
      );
    case StandardStyles.low:
      return AppTextTheme.labelMedium.style.copyWith(
        color: ThemeColors.onPrimaryContainer,
      );
    case StandardStyles.outlined:
      return AppTextTheme.labelMedium.style.copyWith(
        color: ThemeColors.primary,
      );
    case StandardStyles.transparent:
      return AppTextTheme.labelMedium.style.copyWith(
        color: ThemeColors.onSurface,
      );
    case StandardStyles.elevated:
      return AppTextTheme.labelMedium.style.copyWith(
        color: ThemeColors.onPrimary,
      );
    case StandardStyles.error:
      return AppTextTheme.labelMedium.style.copyWith(
        color: ThemeColors.onError,
      );
    case StandardStyles.cancel:
      return AppTextTheme.labelMedium.style.copyWith(
        color: ThemeColors.error,
      );
  }
}
