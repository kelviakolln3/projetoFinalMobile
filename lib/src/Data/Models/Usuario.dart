class Usuario{
  late int? idUsuario;
  late String? login;
  late String? senha;
  late bool? administrador;

  Usuario.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    login = json['login'];
    senha = json['senha'];
    administrador = json['administrador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idUsuario'] = idUsuario;
    data['login'] = login;
    data['senha'] = senha;
    data['administrador'] = administrador;
    return data;
  }
}