import 'package:flutter/material.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/extension/column_extension.dart';
import 'package:myapp/widgets/layout/transparent_divider.dart';
import 'package:myapp/widgets/page/standard_screen.dart';

class StandardSearchPage extends StatelessWidget {
  /// `children` são os filtros disponíveis.
  final List<Widget> children;

  /// `StandardSearchPage` é uma página padrão para exibir filtros. Ele recebe
  /// uma lista de `children` que são os filtros disponíveis.
  const StandardSearchPage({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: StandardScreen(
          title: 'Filtrar por...',
          canPop: true,
          body: ListView(
            children: [
              Text(
                '${children.length} filtros disponíveis',
                style: AppTextTheme.titleLarge.style,
                textAlign: TextAlign.center,
              ),
              const TransparentDivider(),
              Column(
                children: children,
              ).divider(),
            ],
          ),
        ),
      ),
    );
  }
}
