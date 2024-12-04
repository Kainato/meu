import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/extension/list_view_extension.dart';
import 'package:myapp/widgets/base/empty_list.dart';

class StandardListView extends StatelessWidget {
  /// Lista de widgets a serem exibidos no ListView.
  final List<Widget> children;

  /// Define se o ListView é o widget primário da tela.
  final bool primary;

  /// Define a física do ListView.
  final ScrollPhysics? physics;

  /// Define se o ListView deve ser ajustado ao tamanho do conteúdo.
  final bool shrinkWrap;

  /// Este widget é um ListView padrão que recebe uma lista de widgets [children] e
  /// um [primary] booleano que define se o ListView é o widget primário da tela.
  /// Nele são definidos valores padrões mais utilizados no projeto.
  ///
  /// ### Parâmetros
  /// - [children]: Lista de widgets a serem exibidos no ListView.
  /// - [primary]: Define se o ListView é o widget primário da tela.
  /// - [physics]: Define a física do ListView.
  /// - [shrinkWrap]: Define se o ListView deve ser ajustado ao tamanho do conteúdo.
  ///
  /// ### Extensões
  /// - [builder]: Método estático que retorna um ListView.separated com um separador
  /// entre os itens da lista. Caso o [itemCount] seja 0, é retornado um ListView com
  /// um [EmptyList]. Caso contrário, é retornado um ListView.separated com o separador
  /// padrão e um último item informando que o usuário chegou ao final da lista.
  const StandardListView({
    super.key,
    required this.children,
    required this.primary,
    this.physics,
    this.shrinkWrap = false,
  });

  /// Método estático que retorna um ListView.separated com um separador
  /// entre os itens da lista. Caso o [itemCount] seja 0, é retornado um ListView com
  /// um [EmptyList]. Caso contrário, é retornado um ListView.separated com o separador
  /// padrão e um último item informando que o usuário chegou ao final da lista.
  ///
  /// Você pode englobar este componente em um `RefreshIndicator` para adicionar a
  /// funcionalidade de atualização da lista e então passar a função `onRefresh` para
  /// o parâmetro `onRefresh` do método da lista vazia.
  ///
  /// ### Parâmetros
  /// - [itemBuilder]: Função que retorna um widget a ser exibido no ListView.
  /// - [itemCount]: Quantidade de itens a serem exibidos no ListView.
  /// - [primary]: Define se o ListView é o widget primário da tela.
  /// - [physics]: Define a física do ListView.
  /// - [shrinkWrap]: Define se o ListView deve ser ajustado ao tamanho do conteúdo.
  /// - [addLastItem]: Define se deve ser adicionado um último item informando que o usuário
  /// chegou ao final da lista.
  /// - [separator]: Widget que será exibido entre os itens da lista.
  /// - [emptyListLabel]: Mensagem a ser exibida caso a lista esteja vazia.
  static Widget builder({
    required Widget? Function(BuildContext, int) itemBuilder,
    required int itemCount,
    required bool primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    bool addLastItem = true,
    Widget separator = const Divider(height: 8),
    String emptyListLabel = 'Nenhum item a ser visualizado!',
    void Function()? onEmptyRefresh,
  }) {
    return Builder(
      builder: (_) {
        if (itemCount == 0) {
          return Center(
            child: EmptyList(
              label: emptyListLabel,
              refresh: onEmptyRefresh,
            ),
          );
        } else {
          if (addLastItem) {
            return ListView.separated(
              itemCount: itemCount + 1,
              primary: primary,
              physics: physics,
              shrinkWrap: shrinkWrap,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              separatorBuilder: (context, index) {
                if (index < itemCount) {
                  return separator;
                } else {
                  return const SizedBox.shrink();
                }
              },
              itemBuilder: (context, index) {
                if (index < itemCount) {
                  return itemBuilder(context, index);
                } else {
                  return SizedBox(
                    height: 80,
                    child: Center(
                      child: Text(
                        'Você chegou ao final da lista!\n😊',
                        style: AppTextTheme.titleMedium.style,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return ListView.separated(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: itemBuilder,
              separatorBuilder: (context, index) => separator,
              itemCount: itemCount,
              primary: primary,
              physics: physics,
              shrinkWrap: shrinkWrap,
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: physics,
      shrinkWrap: shrinkWrap,
      primary: primary,
    ).withDivider(children: children);
  }
}
