import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';

class SimpleTextRich extends StatelessWidget {
  /// Título do texto.
  final String title;

  /// Valor do texto.
  final String value;

  /// Estilização do título.
  final AppTextTheme styleTitle;

  /// Estilização do valor.
  final AppTextTheme styleValue;

  /// Cria um componente de texto simples com título e valor.
  const SimpleTextRich({
    super.key,
    required this.title,
    required this.value,
    this.styleTitle = AppTextTheme.titleSmall,
    this.styleValue = AppTextTheme.bodyMedium,
  });

  /// Cria um componente de texto com três estilos diferentes.
  static Text doubleRich({
    required String initial,
    required String middle,
    required String end,
    AppTextTheme styleInitial = AppTextTheme.bodyMedium,
    AppTextTheme styleMiddle = AppTextTheme.bodyMedium,
    AppTextTheme styleEnd = AppTextTheme.bodyMedium,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: initial,
            style: styleInitial.style,
          ),
          TextSpan(
            text: middle,
            style: styleMiddle.style,
          ),
          TextSpan(
            text: end,
            style: styleEnd.style,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: styleTitle.style,
          ),
          TextSpan(
            text: value,
            style: styleValue.style,
          ),
        ],
      ),
    );
  }
}
