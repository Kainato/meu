import 'package:flutter/material.dart';

extension ListViewExtension on ListView {
  ListView withDivider(
      {double height = 16.0,
      Color color = Colors.transparent,
      required List<Widget> children}) {
    return ListView.separated(
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) =>
          Divider(height: height, color: color),
      itemCount: children.length,
    );
  }
}
