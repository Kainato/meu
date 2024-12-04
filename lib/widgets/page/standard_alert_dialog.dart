import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/widgets/base/standard_elevated_button.dart';

class StandardAlertDialog extends StatelessWidget {
  /// Título do AlertDialog inserido no topo do componente.
  final String title;

  /// Subtítulo do AlertDialog inserido abaixo do título, tradicionalmente
  /// utilizado para descrever o resumo do conteúdo do AlertDialog.
  final String subtitle;

  /// Ícone do AlertDialog inserido no topo do componente. O ícone é opcional e
  /// pode ser utilizado para representar visualmente o conteúdo do AlertDialog.
  final Icon? icon;

  /// Conteúdo do AlertDialog inserido abaixo do subtítulo. O conteúdo é
  /// tradicionalmente utilizado para descrever detalhadamente o conteúdo do
  /// AlertDialog.
  final List<Widget> content;

  /// Alinhamento cruzado do conteúdo do AlertDialog. O alinhamento cruzado é
  /// utilizado para alinhar o conteúdo do AlertDialog horizontalmente.
  final CrossAxisAlignment crossAxisAlignment;

  /// Ação de fechar o AlertDialog. A ação de fechar é tradicionalmente
  /// utilizada para fechar o AlertDialog sem realizar nenhuma ação.
  final TextButton closeAction;

  /// Ação de confirmar o AlertDialog. A ação de confirmar é opcional e
  /// tradicionalmente utilizada para confirmar a ação do usuário no AlertDialog.
  final StandardElevatedButton? confirmAction;

  /// Define se o conteúdo do AlertDialog é rolável. O conteúdo rolável é
  /// utilizado para permitir que o usuário role o conteúdo do AlertDialog.
  final bool scrollable;

  /// Define se o conteúdo do AlertDialog é expandido. O conteúdo expandido é
  /// utilizado para permitir que o conteúdo do AlertDialog seja expandido de
  /// 400 pixels para 600 pixels de largura.
  final bool expanded;

  /// Cria um AlertDialog padrão para o aplicativo com algumas personalizações
  /// para o melhor uso do componente.
  ///
  /// ### Parâmetros:
  /// - `title`: Título do AlertDialog.
  /// - `subtitle`: Subtítulo do AlertDialog.
  /// - `icon`: Ícone do AlertDialog.
  /// - `content`: Conteúdo do AlertDialog.
  /// - `crossAxisAlignment`: Alinhamento cruzado do conteúdo.
  /// - `closeAction`: Ação de fechar o AlertDialog.
  /// - `confirmAction`: Ação de confirmar o AlertDialog.
  /// - `scrollable`: Define se o conteúdo do AlertDialog é rolável.
  const StandardAlertDialog({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.content = const [],
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.closeAction,
    this.confirmAction,
    this.scrollable = false,
    this.expanded = true,
  });

  /// Cria um AlertDialog que mostra uma mensagem de alerta para o usuário.
  ///
  /// ### Exemplos de uso:
  /// - Deslogar o usuário do aplicativo.
  /// - Excluir um item.
  /// - Cancelar uma ação ou processo.
  static StandardAlertDialog alert({
    required String title,
    required String subtitle,
    required TextButton closeAction,
    required StandardElevatedButton confirmAction,
  }) {
    return StandardAlertDialog(
      title: title,
      subtitle: subtitle,
      closeAction: closeAction,
      confirmAction: confirmAction,
      expanded: false,
    );
  }

  /// Cria um AlertDialog que mostra uma mensagem de informação para o usuário.
  ///
  /// ### Exemplos de uso:
  /// - Informar o usuário sobre uma ação ou processo.
  /// - Informar o usuário sobre uma atualização, mudança ou descrição.
  static StandardAlertDialog info({
    required String title,
    required String subtitle,
    required TextButton closeAction,
  }) {
    return StandardAlertDialog(
      title: title,
      subtitle: subtitle,
      closeAction: closeAction,
      expanded: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextTheme.titleLarge.style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      icon: icon,
      content: SelectionArea(
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxWidth: expanded ? 600 : 400,
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Text(subtitle, style: AppTextTheme.bodyMedium.style),
              if (content.isNotEmpty) const SizedBox(height: 16),
              if (scrollable)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: crossAxisAlignment,
                      children: content,
                    ),
                  ),
                )
              else
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: crossAxisAlignment,
                  children: content,
                ),
            ],
          ),
        ),
      ),
      actions: [
        closeAction,
        if (confirmAction != null) confirmAction!,
      ],
    );
  }
}
