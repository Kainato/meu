import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:myapp/enum/pages.dart';
import 'package:myapp/widgets/page/standard_app_bar.dart';
import 'package:myapp/widgets/page/standard_body.dart';

class StandardScreen extends StatelessWidget {
  /// `title` é o título da página.
  final String title;

  /// `body` é o corpo da página.
  final Widget body;

  /// `hasPadding` é booleano que decide o espaçamento do corpo da página.
  ///
  /// Quando verdadeiro, ele é 20 pixels, entretanto se for uma página que não precisa
  /// de espaçamento (como listagens), é passado um `EdgeInsets.zero`.
  final bool hasPadding;

  /// `page` é a página atual. Ele é usado para exibir o `DrawerWidget`.
  final Pages? page;

  /// `actions` são as ações personalizadas que serão exibidas na `AppBar`.
  final Widget? action;

  /// `popupActions` são as ações extras que serão exibidas em um popup na `AppBar`.
  final List<PopupMenuEntry> popupActions;

  /// `canPop` é uma flag que indica se a página pode ser fechada.
  final bool canPop;

  /// `fab` é o botão flutuante que será exibido no canto inferior direito da tela.
  final Widget? fab;

  /// `persistentFooterButtons` são os botões que serão exibidos no rodapé da tela.
  final List<Widget>? persistentFooterButtons;

  /// `persistentFooterAlignment` é a alinhamento do rodapé da tela.
  final AlignmentDirectional persistentFooterAlignment;

  /// Função que será executada ao clicar no botão de voltar.
  final Widget? leadingAlternative;

  /// `endDrawer` é o drawer que será exibido no final da tela. Normalmente
  /// é usado para exibir filtros.
  final Widget? endDrawer;

  /// `ScreenWidget` é o componente que representa uma tela. Ele funciona como
  /// um `StatelessWidget` que recebe um `title` e um `body` e
  /// retorna um `Scaffold` com um `AppBar` e um `BodyWidget`. Ele também
  /// pode receber um `page` para exibir um `DrawerWidget`.
  const StandardScreen({
    super.key,
    required this.body,
    required this.title,
    this.page,
    this.action,
    this.popupActions = const [],
    this.canPop = false,
    this.hasPadding = false,
    this.fab,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.center,
    this.leadingAlternative,
    this.endDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (result, context) {},
      child: Scaffold(
        appBar: StandardAppBar(
          title: title,
          action: action,
          popupActions: popupActions,
          canPop: canPop,
          leadingAlternative: leadingAlternative,
        ),
        drawer: page == null
            ? null
            : (Device.get().isTablet &&
                    MediaQuery.of(context).orientation == Orientation.landscape)
                ? null
                : const Drawer(),
        endDrawer: endDrawer,
        body: StandardBody(
          body: body,
          padding: hasPadding ? const EdgeInsets.all(20) : EdgeInsets.zero,
          page: page,
        ),
        floatingActionButton: fab,
        persistentFooterButtons: persistentFooterButtons,
        persistentFooterAlignment: persistentFooterAlignment,
      ),
    );
  }
}
