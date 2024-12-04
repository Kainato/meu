enum CachePrefsKey {
  darkMode,
  logged,
  lastFilialId,
  clinicaNome,
  firstTime,
  email,
  server,
  token,
  name,
  id,
  avatar,
  admin,
}

extension GetCachePrefsExtension on CachePrefsKey {
  String get key {
    switch (this) {
      case CachePrefsKey.darkMode:
        return 'darkMode';
      case CachePrefsKey.logged:
        return 'logged';
      case CachePrefsKey.firstTime:
        return 'firstTime';
      case CachePrefsKey.email:
        return 'email';
      case CachePrefsKey.server:
        return 'server';
      case CachePrefsKey.token:
        return 'token';
      case CachePrefsKey.name:
        return 'name';
      case CachePrefsKey.id:
        return 'id';
      case CachePrefsKey.avatar:
        return 'avatar';
      case CachePrefsKey.admin:
        return 'admin';
      case CachePrefsKey.lastFilialId:
        return 'lastFilialId';
      case CachePrefsKey.clinicaNome:
        return 'clinicaNome';
    }
  }

  dynamic get defaultValue {
    switch (this) {
      case CachePrefsKey.darkMode:
        return false;
      case CachePrefsKey.logged:
        return false;
      case CachePrefsKey.firstTime:
        return true;
      case CachePrefsKey.email:
        return '';
      case CachePrefsKey.server:
        return '';
      case CachePrefsKey.token:
        return '';
      case CachePrefsKey.name:
        return '';
      case CachePrefsKey.id:
        return 0;
      case CachePrefsKey.avatar:
        return '';
      case CachePrefsKey.admin:
        return 0;
      case CachePrefsKey.lastFilialId:
        return null;
      case CachePrefsKey.clinicaNome:
        return '';
    }
  }
}
