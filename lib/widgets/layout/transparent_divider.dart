import 'package:flutter/material.dart';

class TransparentDivider extends StatelessWidget {
  /// Tamanho do espaço transparente.
  final double size;

  /// Orientação do espaço transparente. Pode ser `portrait` para funcionar
  /// como um `Divider` ou `landscape` para funcionar como um `VerticalDivider`.
  final Orientation orientation;

  /// O `TransparentDivider` é um widget que cria um espaço transparente entre
  /// os elementos da tela. Ele é útil para separar elementos tanto na vertical
  /// quanto na horizontal.
  ///
  /// ### Exemplo:
  /// ```dart
  /// TransparentDivider(size: 16), // Cria um espaço de 16 pixels na vertical
  /// [...] // Outros elementos
  /// TransparentDivider(size: 16, orientation: Orientation.landscape), // Cria um espaço de 16 pixels na horizontal
  /// ```
  const TransparentDivider({
    super.key,
    this.size = 16,
    this.orientation = Orientation.portrait,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: orientation == Orientation.portrait ? size : 0,
      width: orientation == Orientation.landscape ? size : 0,
    );
  }
}
