import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/navigation.dart';
import 'package:myapp/enum/media.dart';
import 'package:myapp/enum/snack_bars.dart';
import 'package:myapp/widgets/base/cache_image.dart';
import 'package:myapp/widgets/base/standard_list_tile.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Título da AppBar.
  final String title;

  /// Ações que serão exibidas na AppBar.
  final Widget? action;

  /// Ações extras que serão exibidas em um popup na AppBar.
  final List<PopupMenuEntry> popupActions;

  /// Se a AppBar deve exibir um botão de voltar.
  final bool canPop;

  /// Função que será executada ao clicar no botão de voltar.
  final Widget? leadingAlternative;

  /// Cria um widget de AppBar que exibe um título e ações. Para mais detalhes
  /// sobre este widget, veja a documentação de
  /// [AppBar Material 3](https://m3.material.io/components/top-app-bar/overview)
  ///
  /// ### Parâmetros
  /// - String title: Título da AppBar. Localizado no lado esquerdo.
  /// - List<Widget> actions: Ações que serão exibidas do lado direito na AppBar.
  const StandardAppBar({
    super.key,
    required this.title,
    this.canPop = false,
    this.action,
    this.popupActions = const [],
    this.leadingAlternative,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextTheme.headlineMedium.style, maxLines: 2),
      leading: canPop
          ? leadingAlternative ??
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                tooltip: 'Voltar',
                onPressed: () => Navigation.pop(context),
              )
          : CacheImage.circular(
              Media.logo.path,
              fit: BoxFit.cover,
              radius: MediaQuery.of(context).size.height,
              cacheRadius: 240,
            ),
      actions: [
        if (action != null) action!,
        if (popupActions.isNotEmpty) ...[
          PopupMenuButton(
            tooltip: 'Mais ações da página',
            itemBuilder: (context) => [
              ...popupActions,
              PopupMenuItem(
                child: const StandardListTile(
                  title: 'Ajuda',
                  leading: Icon(Icons.help_outline),
                  onTap: null,
                ),
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBars.info.getSnackBar(
                    context,
                    'Funcionalidade em desenvolvimento!',
                  ),
                ),
              )
            ],
          ),
        ] else ...[
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: 'Ajuda',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBars.info
                  .getSnackBar(context, 'Funcionalidade em desenvolvimento!'),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
