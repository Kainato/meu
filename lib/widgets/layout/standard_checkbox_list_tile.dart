import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';

class StandardCheckboxListTile extends StatefulWidget {
  /// `value` é o valor do `CheckboxListTile`. Ele é quem determina
  /// se o `CheckboxListTile` está marcado ou não.
  final bool value;

  /// `onChanged` é a função que é chamada quando o `CheckboxListTile` é alterado.
  /// Ela recebe um `bool?` que é o novo valor do `CheckboxListTile`.
  final Function(bool?) onChanged;

  /// `title` é o título do `CheckboxListTile`.
  /// A estilização é feita com `AppTextTheme.titleMedium`.
  final String title;

  /// `subtitle` é o subtítulo do `CheckboxListTile`.
  /// A estilização é feita com `AppTextTheme.labelMedium`.
  final String subtitle;

  /// `StandardCheckboxListTile` é um `CheckboxListTile` padrão do aplicativo.
  ///
  /// ### Parâmetros
  /// - `value` é o valor do `CheckboxListTile`.
  /// - `onChanged` é a função que é chamada quando o `CheckboxListTile` é alterado.
  /// - `title` é o título do `CheckboxListTile`.
  /// - `subtitle` é o subtítulo do `CheckboxListTile`.
  const StandardCheckboxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle = '',
  });

  @override
  State<StandardCheckboxListTile> createState() =>
      _StandardCheckboxListTileState();
}

class _StandardCheckboxListTileState extends State<StandardCheckboxListTile> {
  bool get value => widget.value;
  Function(bool?)? get onChanged => widget.onChanged;
  String get title => widget.title;
  String get subtitle => widget.subtitle;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title, style: AppTextTheme.titleMedium.style),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: AppTextTheme.labelMedium.style,
            )
          : null,
    );
  }
}
