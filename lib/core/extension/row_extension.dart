import 'package:flutter/material.dart';

extension RowExtension on Row {
  SizedBox expanded() {
    return SizedBox(
      width: double.maxFinite,
      child: this,
    );
  }

  Padding padding() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: this,
    );
  }

  Row divider({double width = 16.0, Color color = Colors.transparent}) {
    List<Widget> dividedChildren = [];
    for (int i = 0; i < children.length; i++) {
      dividedChildren.add(children[i]);
      if (i < children.length - 1) {
        dividedChildren.add(VerticalDivider(width: width, color: color));
      }
    }
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: dividedChildren,
    );
  }
}
