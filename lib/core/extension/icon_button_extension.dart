import 'package:flutter/material.dart';
import 'package:myapp/core/theme_colors.dart';

extension IconButtonExtension on IconButton {
  Container splash(
    BuildContext context, {
    required bool active,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? ThemeColors.primary.withOpacity(0.1) : null,
      ),
      child: this,
    );
  }
}
