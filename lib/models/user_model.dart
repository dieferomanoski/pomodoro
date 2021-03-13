import 'dart:convert' as convert;

class AppUser {
  String login;
  String name;
  String email;
  String urlPicture;

  AppUser({
    this.login,
    this.name,
    this.email,
    this.urlPicture,
  });

  AppUser.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['nome'];
    email = json['email'];
    urlPicture = json['urlFoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['nome'] = this.name;
    data['email'] = this.email;
    data['urlFoto'] = this.urlPicture;

    return data;
  }

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $name}';
  }
}
