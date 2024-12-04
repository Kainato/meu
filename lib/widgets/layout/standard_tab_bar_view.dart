import 'package:flutter/material.dart';

class StandardTabBarView extends StatelessWidget {
  /// `tabController` é o controlador das abas.
  final TabController tabController;

  /// `tabs` são as abas que serão exibidas.
  final List<Widget> tabs;

  /// `animatedKey` é a chave de identificação da animação.
  final ValueKey animatedKey;

  /// `StandardTabBarView` é um componente que representa uma barra de abas.
  ///
  /// ### Parâmetros
  /// - `tabController` é o controlador das abas.
  /// - `tabs` são as abas que serão exibidas.
  /// - `animatedKey` é a chave de identificação da animação.
  const StandardTabBarView({
    super.key,
    required this.tabController,
    required this.tabs,
    required this.animatedKey,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      key: animatedKey,
      physics: const NeverScrollableScrollPhysics(),
      controller: tabController,
      children: tabs,
    );
  }
}
