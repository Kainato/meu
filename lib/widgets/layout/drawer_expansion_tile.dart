import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';

class DrawerExpansionTile extends StatelessWidget {
  final String title;
  final bool initiallyExpanded;
  final List<Widget> children;

  const DrawerExpansionTile({
    super.key,
    required this.title,
    required this.initiallyExpanded,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: AppTextTheme.titleMedium.style,
      ),
      initiallyExpanded: initiallyExpanded,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
      children: children,
    );
  }
}
