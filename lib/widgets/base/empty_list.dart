import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/enum/standard_styles.dart';
import 'package:myapp/widgets/base/standard_elevated_button.dart';
import 'package:myapp/widgets/layout/transparent_divider.dart';
import 'package:myapp/core/theme_colors.dart';

class EmptyList extends StatelessWidget {
  /// Mensagem a ser exibida.
  final String label;

  /// Função de atualização da lista.
  final void Function()? refresh;

  /// Este widget é um componente que exibe uma mensagem de lista vazia.
  /// Ele recebe um [label] que é a mensagem a ser exibida e um [refresh]
  /// que é a função de atualização da lista.
  const EmptyList({super.key, required this.label, this.refresh});

  @override
  Widget build(BuildContext context) {
    Color color = ThemeColors.onSurfaceVariant.withOpacity(0.5);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info_outline,
          size: 48,
          color: color,
        ),
        const TransparentDivider(size: 16),
        Text(
          label,
          style: AppTextTheme.displayMedium.style.copyWith(
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
        if (refresh != null) ...[
          const TransparentDivider(size: 16),
          StandardElevatedButton(
            onPressed: refresh!,
            style: StandardStyles.low,
            label: 'Atualizar',
            icon: Icons.refresh,
          ),
        ],
      ],
    );
  }
}
