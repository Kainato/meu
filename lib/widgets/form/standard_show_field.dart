import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/extension/row_extension.dart';
import 'package:myapp/core/extension/text_extension.dart';
import 'package:myapp/enum/snack_bars.dart';
import 'package:myapp/widgets/page/standard_alert_dialog.dart';
import 'package:myapp/core/theme_colors.dart';

class StandardShowField extends StatelessWidget {
  /// `title` é o título a ser exibido. Ele é o que indica ao usuário o que
  /// o campo representa.
  final String title;

  /// `value` é o valor a ser exibido. Se não for informado, o campo será
  /// exibido com uma mensagem indicando que o valor não foi informado.
  final String? value;

  /// `maxLines` é o número máximo de linhas que o campo de valor pode ter.
  /// Com um valor definido, abrirá um diálogo ou expandirá o valor do campo na tela.
  final int? maxLines;

  /// `isDialog` é um booleano que indica se o campo de valor deve ser exibido
  /// em um diálogo ou não. Se for `true`, o campo de valor será exibido em um
  /// diálogo. Se for `false`, o campo de valor será expansível na tela.
  final bool isDialog;

  /// `StandardShowField` é um campo de exibição padrão. Ele exibe um título e
  /// um valor em um layout de linha.
  ///
  /// ### Parâmetros
  /// - `title` é o título a ser exibido.
  /// - `value` é o valor a ser exibido.
  /// - `maxLines` é o número máximo de linhas que o campo de valor pode ter.
  /// - `isDialog` é um booleano que indica se o campo de valor deve ser exibido
  const StandardShowField({
    super.key,
    required this.title,
    this.value,
    this.maxLines,
    this.isDialog = false,
  });

  /// `titleHeader` é um cabeçalho de título. Ele exibe um título em um layout
  /// de linha.
  static Widget titleHeader({
    required String value,
  }) {
    return SizedBox(
      width: double.maxFinite,
      child: Text(
        value,
        style: AppTextTheme.titleLarge.style,
        textAlign: TextAlign.start,
      ).padding(left: 16.0, right: 16.0),
    );
  }

  /// `header` é um cabeçalho de título. Ele exibe um título e um ícone em um
  /// layout de linha.
  static Widget header({
    required String value,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(icon),
        Flexible(
          child: Text(
            value,
            style: AppTextTheme.titleSmall.style,
            textAlign: TextAlign.start,
          ).padding(left: 8.0),
        ),
      ],
    ).padding();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);
    return ValueListenableBuilder(
      valueListenable: isExpanded,
      builder: (context, expansion, child) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: AppTextTheme.titleMedium.style),
              ...titleActions(
                context,
                title: title,
                value: value,
                isExpanded: isExpanded,
                maxLines: maxLines,
                isDialog: isDialog,
                expansion: expansion,
              ),
            ],
          ),
          subtitle: AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: ThemeColors.inverseSurface,
                  width: 1,
                ),
              ),
              child: value != null
                  ? Text(
                      value!,
                      style: AppTextTheme.labelMedium.style,
                      maxLines: expansion ? null : maxLines,
                      overflow: expansion
                          ? null
                          : maxLines != null
                              ? TextOverflow.ellipsis
                              : null,
                    )
                  : Text(
                      'Sem informações disponíveis',
                      maxLines: maxLines,
                      style: AppTextTheme.labelMedium.style
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
            ),
          ),
        );
      },
    );
  }
}

List<Widget> titleActions(
  BuildContext context, {
  required String title,
  required String? value,
  required ValueNotifier<bool> isExpanded,
  required int? maxLines,
  required bool isDialog,
  bool expansion = false,
}) {
  return [
    Row(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: IconButton(
            tooltip: 'Copiar para a área de transferência',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              Icons.copy_rounded,
              size: 20,
              color: ThemeColors.onSurface.withOpacity(0.25),
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value ?? ''));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBars.info.getSnackBar(
                    context, 'Valor copiado para a área de transferência!'),
              );
            },
          ),
        ),
        if (maxLines != null && !isDialog) ...[
          SizedBox(
            height: 30,
            width: 30,
            child: IconButton(
              tooltip:
                  expansion ? 'Recolher informações' : 'Expandir informações',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                expansion ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 20,
                color: ThemeColors.onSurface.withOpacity(0.25),
              ),
              onPressed: () {
                if (expansion) {
                  isExpanded.value = false;
                } else {
                  isExpanded.value = true;
                }
              },
            ),
          ),
        ] else if (maxLines != null && isDialog) ...[
          SizedBox(
            height: 30,
            width: 30,
            child: IconButton(
              tooltip: 'Ver mais informações',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.open_in_new_rounded,
                size: 20,
                color: ThemeColors.onSurface.withOpacity(0.25),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StandardAlertDialog.info(
                      title: title,
                      subtitle: value ?? 'Sem informações disponíveis',
                      closeAction: TextButton(
                        child: Text('Fechar',
                            style: AppTextTheme.labelMedium.style),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ]
      ],
    ),
  ];
}
