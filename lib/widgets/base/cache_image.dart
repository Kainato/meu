import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  /// Caminho da imagem no projeto. As imagens devem estar presentes na pasta
  /// `assets/images` e devem ser referenciadas com o caminho completo a partir
  /// do enum `Media`.
  ///
  /// ```dart
  /// import 'package:myapp/core/media.dart';
  ///
  /// CacheImage(Media.dashboard.path),
  ///```
  final String path;

  /// Valor da Altura da imagem.
  final double height;

  /// Valor da Largura da imagem.
  final double width;

  /// Forma de ajuste da imagem.
  final BoxFit fit;

  /// Altura do cache da imagem.
  final int? cacheHeight;

  /// Largura do cache da imagem.
  final int? cacheWidth;

  /// Opacidade da imagem.
  final double opacity;

  /// O `CacheImage` é um widget que carrega uma imagem do projeto e a exibe na
  /// tela. Ele é útil para exibir imagens que estão presentes no projeto e que
  /// não precisam ser carregadas da internet.
  ///
  /// ### Parâmetros:
  /// - `path`: Caminho da imagem no projeto.
  /// - `height`: Altura da imagem.
  /// - `width`: Largura da imagem.
  /// - `fit`: Forma de ajuste da imagem.
  /// - `cacheHeight`: Altura do cache da imagem.
  /// - `cacheWidth`: Largura do cache da imagem.
  ///
  /// ### Adicionais:
  /// - `CacheImage.circular`: Cria uma imagem circular com base no raio do círculo.
  const CacheImage(
    this.path, {
    super.key,
    this.fit = BoxFit.cover,
    this.height = double.infinity,
    this.width = double.infinity,
    this.cacheHeight,
    this.cacheWidth,
    this.opacity = 1.0,
  });

  /// Cria uma imagem circular com base no caminho da imagem, no raio de um círculo
  /// e no ajuste da imagem.
  ///
  /// ### Parâmetros:
  /// - `path`: Caminho da imagem no projeto.
  /// - `radius`: Raio do círculo.
  /// - `cacheRadius`: Raio do cache da imagem.
  /// - `fit`: Forma de ajuste da imagem.
  static CacheImage circular(
    String path, {
    required double radius,
    int? cacheRadius,
    BoxFit fit = BoxFit.cover,
    double opacity = 1.0,
  }) {
    return CacheImage(
      path,
      fit: fit,
      height: radius,
      width: radius,
      cacheHeight: cacheRadius,
      cacheWidth: cacheRadius,
      opacity: opacity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      height: height,
      width: width,
      opacity: AlwaysStoppedAnimation(opacity),
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
    );
  }
}
