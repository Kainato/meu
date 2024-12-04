import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/home_page.dart';
import 'package:provider/provider.dart';
import 'package:myapp/app_theme.dart';
import 'package:myapp/core/theme_colors.dart';
import 'package:myapp/core/theme_provider.dart';

class AppWidget extends StatefulWidget {
  final bool? darkMode;
  final bool logged;
  final bool firstTime;
  final int? lastFilialId;

  const AppWidget({
    super.key,
    required this.darkMode,
    required this.logged,
    required this.firstTime,
    required this.lastFilialId,
  });

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool? get darkMode => widget.darkMode;
  bool get logged => widget.logged;
  bool get firstTime => widget.firstTime;
  int? get lastFilialId => widget.lastFilialId;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Meu Diário',
          theme: const AppTheme().light(),
          darkTheme: const AppTheme().dark(),
          themeMode: themeProvider.themeMode,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'), // Inglês
            Locale('pt', 'BR'), // Português do Brasil
          ],
          locale: const Locale('pt', 'BR'), // Defina o locale padrão
          home: Builder(
            builder: (context) {
              // Inicializa o ThemeColors com o ThemeData atual
              ThemeColors.init(Theme.of(context));
              return const HomePage();
            },
          ),
        );
      },
    );
  }
}
