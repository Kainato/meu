import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/theme_colors.dart';

class StandardTabBar extends StatelessWidget {
  /// `tabController` é o controlador das abas.
  final TabController tabController;

  /// `tabs` são as abas que serão exibidas.
  final List<String> tabs;

  /// `onTap` é a função que será executada ao clicar em uma aba.
  final void Function(int)? onTap;

  /// `StandardTabBar` é um componente que representa uma barra de abas.
  ///
  /// ### Parâmetros
  /// - `tabController` é o controlador das abas.
  /// - `tabs` são as abas que serão exibidas.
  const StandardTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      controller: tabController,
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: ThemeColors.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: onTap,
      tabs: List.generate(
        tabs.length,
        (index) {
          return Tab(
            child: Text(
              '${index + 1}. ${tabs[index]}',
              maxLines: 1,
              style: AppTextTheme.titleMedium.style.copyWith(
                color: ThemeColors.onPrimaryContainer,
              ),
            ),
          );
        },
      ),
    );
  }
}
