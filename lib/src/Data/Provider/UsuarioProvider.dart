import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Usuario.dart';
class UsuarioProvider{

  Future<bool> buscarUsuario(int id, String senha) async {
    http.Response res = await http.get(Uri.parse('http://192.168.0.16:8080/usuario/$id'));
    if(res.statusCode == 200){
      dynamic body = jsonDecode(res.body);
      Usuario usuario = Usuario.fromJson(body);
      if(usuario.senha == senha){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }
}