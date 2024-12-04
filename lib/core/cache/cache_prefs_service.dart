import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/core/cache/cache_prefs.dart';
import 'package:myapp/enum/cache_prefs_key.dart';

/// Service para manipulação de preferências de cache do aplicativo.
class CachePrefsService {
  /// Define um valor `bool` para uma chave de `GetCachePrefs`.
  static Future<void> setBool(CachePrefsKey key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.key, value);
  }

  /// Obtém um valor `bool` para uma chave de `GetCachePrefs`.
  static Future<bool> getBool(CachePrefsKey key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key.key) ?? key.defaultValue;
  }

  /// Define um valor `String` para uma chave de `GetCachePrefs`.
  static Future<void> setString(CachePrefsKey key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.key, value);
  }

  /// Obtém um valor `String` para uma chave de `GetCachePrefs`.
  static Future<String> getString(CachePrefsKey key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.key) ?? key.defaultValue;
  }

  /// Define um valor `int` para uma chave de `GetCachePrefs`.
  static Future<void> setInt(CachePrefsKey key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key.key, value);
  }

  /// Obtém um valor `int` para uma chave de `GetCachePrefs`.
  static Future<bool> getInt(CachePrefsKey key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key.key) ?? key.defaultValue;
  }

  /// Obtém um valor `CachePrefs` com todas as preferências de cache.
  Future<CachePrefs> getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final CachePrefs cachePrefs = CachePrefs(
      darkMode: prefs.getBool(CachePrefsKey.darkMode.key) ?? false,
      logged: prefs.getBool(CachePrefsKey.logged.key) ?? false,
      firstTime: prefs.getBool(CachePrefsKey.firstTime.key) ?? true,
      email: prefs.getString(CachePrefsKey.email.key) ?? '',
      server: prefs.getString(CachePrefsKey.server.key) ?? '',
      token: prefs.getString(CachePrefsKey.token.key) ?? '',
      name: prefs.getString(CachePrefsKey.name.key) ?? '',
      id: prefs.getInt(CachePrefsKey.id.key) ?? 0,
      avatar: prefs.getString(CachePrefsKey.avatar.key) ?? '',
      admin: prefs.getInt(CachePrefsKey.admin.key) ?? 0,
      lastFilialId: prefs.getInt(CachePrefsKey.lastFilialId.key),
      clinicaNome: prefs.getString(CachePrefsKey.clinicaNome.key) ?? '',
    );

    return cachePrefs;
  }

  /// Limpa todas as preferências de cache, mas mantém o `darkMode` e o `firstTime`.
  /// - O `darkMode` é mantido para que o usuário não tenha que redefinir o tema.
  /// - O `firstTime` é mantido para que o usuário não tenha que passar pelo tutorial novamente.
  /// - O `server` é mantido para que o usuário não tenha que redefinir o ambiente.
  static Future<void> clearPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool darkMode = prefs.getBool(CachePrefsKey.darkMode.key) ?? false;
    final bool firstTime = prefs.getBool(CachePrefsKey.firstTime.key) ?? true;
    final String server = prefs.getString(CachePrefsKey.server.key) ?? '';

    await prefs.clear();

    await prefs.setBool(CachePrefsKey.darkMode.key, darkMode);
    await prefs.setBool(CachePrefsKey.firstTime.key, firstTime);
    await prefs.setString(CachePrefsKey.server.key, server);
  }

  /// Limpa a clínica que o usuário estava selecionado
  static Future<void> clearPrefsClinic() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool darkMode = prefs.getBool(CachePrefsKey.darkMode.key) ?? false;
    final bool firstTime = prefs.getBool(CachePrefsKey.firstTime.key) ?? true;
    final String server = prefs.getString(CachePrefsKey.server.key) ?? '';
    final bool logged = prefs.getBool(CachePrefsKey.logged.key) ?? true;
    final String email = prefs.getString(CachePrefsKey.email.key) ?? '';
    final String token = prefs.getString(CachePrefsKey.token.key) ?? '';
    final String name = prefs.getString(CachePrefsKey.name.key) ?? '';
    final int id = prefs.getInt(CachePrefsKey.id.key) ?? 0;
    final String avatar = prefs.getString(CachePrefsKey.avatar.key) ?? '';
    final int admin = prefs.getInt(CachePrefsKey.admin.key) ?? 0;

    await prefs.clear();

    await prefs.setBool(CachePrefsKey.darkMode.key, darkMode);
    await prefs.setBool(CachePrefsKey.firstTime.key, firstTime);
    await prefs.setBool(CachePrefsKey.logged.key, logged);
    await prefs.setString(CachePrefsKey.server.key, server);
    await prefs.setString(CachePrefsKey.email.key, email);
    await prefs.setString(CachePrefsKey.token.key, token);
    await prefs.setString(CachePrefsKey.name.key, name);
    await prefs.setInt(CachePrefsKey.id.key, id);
    await prefs.setString(CachePrefsKey.avatar.key, avatar);
    await prefs.setInt(CachePrefsKey.admin.key, admin);
  }
}
