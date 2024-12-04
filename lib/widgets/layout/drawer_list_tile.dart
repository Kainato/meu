import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/navigation.dart';
import 'package:myapp/core/theme_colors.dart';

class DrawerListTile extends StatelessWidget {
  /// O rótulo do item de lista.
  final String label;

  /// O ícone do item de lista. Normalmente é utilizado os ícones padrões do Material Design.
  /// Você pode consultar os ícones em
  /// [Material Google Icons](https://material.io/resources/icons/?style=baseline).
  final IconData icon;

  /// Se o item de lista está selecionado.
  final bool selected;

  /// A função chamada quando o item de lista é tocado.
  final Function onTap;

  /// O `DrawerListTile` é um item de lista que é utilizado no drawer do aplicativo.
  /// Ele é utilizado para mostrar ao usuário onde ele está
  /// e para navegar entre as telas do aplicativo.
  ///
  /// Já possui um estilo pré-definido tanto para se estiver selecionado ou não.
  ///
  /// ### Parâmetros
  /// - `label`: O rótulo do item de lista.
  /// - `icon`: O ícone do item de lista.
  /// - `selected`: Se o item de lista está selecionado.
  /// - `onTap`: A função chamada quando o item de lista é tocado.
  const DrawerListTile({
    super.key,
    required this.label,
    required this.icon,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      selected: selected,
      style: ListTileStyle.drawer,
      selectedColor: ThemeColors.onPrimary,
      selectedTileColor: ThemeColors.primary,
      title: Text(label, style: AppTextTheme.titleSmall.style),
      leading: Icon(
        icon,
        color: selected ? ThemeColors.onPrimary : ThemeColors.primary,
      ),
      onTap: () {
        if (selected) {
          Navigation.pop(context);
        } else {
          onTap();
        }
      },
    );
  }
}
