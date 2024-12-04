import 'package:flutter/material.dart';

extension ColumnDividerExtension on Column {
  Column divider({double height = 16.0, Color color = Colors.transparent}) {
    List<Widget> dividedChildren = [];
    for (int i = 0; i < children.length; i++) {
      dividedChildren.add(children[i]);
      if (i < children.length - 1) {
        dividedChildren.add(Divider(height: height, color: color));
      }
    }
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: dividedChildren,
    );
  }
}
