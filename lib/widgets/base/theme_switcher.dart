import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/core/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  /// `ThemeSwitcher` é o widget que alterna entre os temas claro e escuro.
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
          if (themeProvider.themeMode == ThemeMode.dark) {
            return const Icon(Icons.nightlight_round);
          } else {
            return const Icon(Icons.wb_sunny);
          }
        },
      ),
      value: themeProvider.themeMode == ThemeMode.dark,
      onChanged: (value) {
        themeProvider.setThemeMode(
          value ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
