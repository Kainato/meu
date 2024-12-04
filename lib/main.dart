import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/app_widget.dart';
import 'package:myapp/core/theme_provider.dart';
import 'package:myapp/enum/cache_prefs_key.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Inicializando o Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Configurando o Flutter para não mostrar a barra de status
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  // Resgatando as preferências do usuário
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Resgatando o tema escolhido pelo usuário
  // - prefs.getBool('darkMode')
  bool? darkMode = prefs.getBool(CachePrefsKey.darkMode.key);
  // Resgatando se o usuário está logado
  // - prefs.getBool('logged')
  bool logged = prefs.getBool(CachePrefsKey.logged.key) ?? false;
  // Resgatando se é a primeira vez que o usuário está abrindo o app
  // - prefs.getBool('firstTime')
  bool firstTime = prefs.getBool(CachePrefsKey.firstTime.key) ?? true;
  // Resgatando se o usuário já escolheu uma filial
  // - prefs.getInt('lastFilialId')
  int? lastFilialId = prefs.getInt(CachePrefsKey.lastFilialId.key);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(
        darkMode: darkMode,
        logged: logged,
        firstTime: firstTime,
        lastFilialId: lastFilialId,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? darkMode;
  final bool logged;
  final bool firstTime;
  final int? lastFilialId;

  const MyApp({
    super.key,
    this.darkMode,
    required this.logged,
    required this.firstTime,
    this.lastFilialId,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppWidget(
      darkMode: darkMode,
      logged: logged,
      firstTime: firstTime,
      lastFilialId: lastFilialId,
    );
  }
}
