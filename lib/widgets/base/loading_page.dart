import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/widgets/layout/transparent_divider.dart';
import 'package:myapp/core/theme_colors.dart';

class LoadingPage extends StatelessWidget {
  /// Valor de progresso do CircularProgressIndicator.
  final double value;

  /// Lista de textos que serão animados para informar o usuário que os dados
  /// da página estão carregando.
  final List<String> animatedTexts;

  /// Um loading page com um CircularProgressIndicator e um texto animado para
  /// informar o usuário que os dados da página está carregando.
  ///
  /// ### Parâmetros:
  /// - `value`: Valor de progresso do CircularProgressIndicator.
  /// - `animatedTexts`: Lista de textos que serão animados por `AnimatedTextKit`.
  const LoadingPage({
    super.key,
    required this.value,
    required this.animatedTexts,
  });

  @override
  Widget build(BuildContext context) {
    // Cria uma lista de textos que serão animados e randomizados
    List<String> textsList = [];
    // Adiciona os textos passados por parâmetro na lista
    for (int i = 0; i < animatedTexts.length; i++) {
      textsList.add(animatedTexts[i]);
    }
    // Embaralha a lista de textos
    textsList.shuffle();
    // Retorna o widget de carregamento
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 75,
              width: 75,
              child: CircularProgressIndicator(
                value: value,
                strokeCap: StrokeCap.round,
                strokeWidth: 8,
                semanticsLabel: 'Carregando...',
                color: ThemeColors.primary,
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .inverseSurface
                    .withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(
                  ThemeColors.primary,
                ),
              ),
            ),
            Text(
              '${(value * 100).toStringAsFixed(0)}%',
              style: AppTextTheme.titleMedium.style,
            ),
          ],
        ),
        const TransparentDivider(size: 24),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: textsList
              .map(
                (text) => TyperAnimatedText(
                  text,
                  textAlign: TextAlign.center,
                  speed: const Duration(milliseconds: 50),
                  textStyle: AppTextTheme.titleLarge.style,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
