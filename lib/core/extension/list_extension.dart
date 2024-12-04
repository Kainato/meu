import 'package:flutter/material.dart';
import 'package:myapp/widgets/layout/transparent_divider.dart';

extension ListExtension on List {
  /*
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
   */

  List<Widget> divider({Widget divider = const TransparentDivider()}) {
    List<Widget> dividedChildren = [];
    for (int i = 0; i < length; i++) {
      dividedChildren.add(this[i]);
      if (i < length - 1) {
        dividedChildren.add(divider);
      }
    }
    return dividedChildren;
  }
}
