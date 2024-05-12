import '../Provider/UsuarioProvider.dart';

class LoginRepository{
  UsuarioProvider usuarioProvider = UsuarioProvider();

  Future<bool> login(int id, String senha){
    return usuarioProvider.buscarUsuario(id, senha);
  }
}