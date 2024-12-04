import 'package:flutter/material.dart';

extension TextExtension on Text {
  SizedBox expanded({double width = double.maxFinite}) {
    return SizedBox(
      width: width,
      child: this,
    );
  }

  Padding padding({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: this,
    );
  }
}
