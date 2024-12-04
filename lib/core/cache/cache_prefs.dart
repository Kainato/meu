// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CachePrefs {
  /// Variável que guarda se o modo escuro está ativado
  bool darkMode;

  /// Variável que guarda se o usuário está logado
  bool logged;

  /// Variável que guarda se é a primeira vez que o aplicativo é aberto
  bool firstTime;

  /// Variável que guarda o email do usuário
  String email;

  /// Variável que guarda o id da última filial
  int? lastFilialId;

  /// Variável que guarda o servidor
  String server;

  /// Variável que guarda o token
  String token;

  /// Variável que guarda o nome do usuário
  String name;

  /// Variável que guarda o id do usuário
  int id;

  /// Variável que guarda o avatar do usuário
  String? avatar;

  /// Variável que guarda se o usuário é admin
  int admin;

  /// Variável que guarda o nome da clínica
  String clinicaNome;

  /// Classe que representa as preferências do cache do aplicativo
  CachePrefs({
    required this.darkMode,
    required this.logged,
    required this.firstTime,
    required this.email,
    this.lastFilialId,
    required this.server,
    required this.token,
    required this.name,
    required this.id,
    this.avatar,
    required this.admin,
    required this.clinicaNome,
  });

  /// Cria uma nova instância da classe `CachePrefs` com os valores atualizados.
  CachePrefs copyWith({
    bool? darkMode,
    bool? logged,
    bool? firstTime,
    String? email,
    int? lastFilialId,
    String? server,
    String? token,
    String? name,
    int? id,
    String? avatar,
    bool? ativo,
    int? admin,
    String? clinicaNome,
  }) {
    return CachePrefs(
      darkMode: darkMode ?? this.darkMode,
      logged: logged ?? this.logged,
      firstTime: firstTime ?? this.firstTime,
      email: email ?? this.email,
      lastFilialId: lastFilialId ?? this.lastFilialId,
      server: server ?? this.server,
      token: token ?? this.token,
      name: name ?? this.name,
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      admin: admin ?? this.admin,
      clinicaNome: clinicaNome ?? this.clinicaNome,
    );
  }

  /// Converte em um mapa os valores da instância da classe `CachePrefs`.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'darkMode': darkMode,
      'logged': logged,
      'firstTime': firstTime,
      'email': email,
      'lastFilialId': lastFilialId,
      'server': server,
      'token': token,
      'name': name,
      'id': id,
      'avatar': avatar,
      'admin': admin,
      'clinicaNome': clinicaNome,
    };
  }

  /// Converte em uma instância da classe `CachePrefs` com valores de um mapa.
  factory CachePrefs.fromMap(Map<String, dynamic> map) {
    return CachePrefs(
      darkMode: map['darkMode'],
      logged: map['logged'],
      firstTime: map['firstTime'],
      email: map['email'],
      lastFilialId: map['lastFilialId'],
      server: map['server'],
      token: map['token'],
      name: map['name'],
      id: map['id'],
      avatar: map['avatar'],
      admin: map['admin'],
      clinicaNome: map['clinicaNome'],
    );
  }

  /// Converte em uma instância da classe `CachePrefs` com valores de um JSON.
  String toJson() => json.encode(toMap());

  /// Converte em uma instância da classe `CachePrefs` com valores de um JSON.
  factory CachePrefs.fromJson(String source) =>
      CachePrefs.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Retorna uma representação em String da instância da classe `CachePrefs`.
  @override
  String toString() {
    return 'CachePrefs(darkMode: $darkMode, logged: $logged, firstTime: $firstTime, email: $email, lastFilialId: $lastFilialId, server: $server, token: $token, name: $name, id: $id, avatar: $avatar, admin: $admin, clinicaNome: $clinicaNome)';
  }

  /// Compara duas instâncias da classe `CachePrefs`.
  @override
  bool operator ==(covariant CachePrefs other) {
    if (identical(this, other)) return true;

    return other.darkMode == darkMode &&
        other.logged == logged &&
        other.firstTime == firstTime &&
        other.email == email &&
        other.lastFilialId == lastFilialId &&
        other.server == server &&
        other.token == token &&
        other.name == name &&
        other.id == id &&
        other.avatar == avatar &&
        other.admin == admin &&
        other.clinicaNome == clinicaNome;
  }

  /// Gera um código de hash para a instância da classe `CachePrefs`.
  @override
  int get hashCode {
    return darkMode.hashCode ^
        logged.hashCode ^
        firstTime.hashCode ^
        email.hashCode ^
        lastFilialId.hashCode ^
        server.hashCode ^
        token.hashCode ^
        name.hashCode ^
        id.hashCode ^
        avatar.hashCode ^
        admin.hashCode ^
        clinicaNome.hashCode;
  }

  // Limpa todos os valores da instância da classe `CachePrefs`.
  void clear() {
    darkMode = false;
    logged = false;
    firstTime = true;
    email = '';
    lastFilialId = 0;
    server = '';
    token = '';
    name = '';
    id = 0;
    avatar = '';
    admin = 0;
    clinicaNome = '';
  }
}
