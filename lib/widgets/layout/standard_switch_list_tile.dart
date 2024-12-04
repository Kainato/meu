import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';

class StandardSwitchListTile extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;
  final String title;
  final String subtitle;

  const StandardSwitchListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle = '',
  });

  @override
  State<StandardSwitchListTile> createState() =>
      _StandardCheckboxListTileState();
}

class _StandardCheckboxListTileState extends State<StandardSwitchListTile> {
  bool get value => widget.value;
  Function(bool) get onChanged => widget.onChanged;
  String get title => widget.title;
  String get subtitle => widget.subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
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
