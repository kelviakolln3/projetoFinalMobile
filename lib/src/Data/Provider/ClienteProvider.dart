import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/Cliente.dart';

class ClienteProvider extends GetxController{
  Future<List<Cliente>> buscarClientes() async {
    List<Cliente> clientes = [];
    http.Response res = await http.get(Uri.parse('http://192.168.0.16:8080/cliente'));
    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      clientes = body.map((dynamic item) => Cliente.fromJson(item)).toList();
    }
    return clientes;
  }

  Future<bool> cadastrarCliente(Cliente cliente) async{
    http.Response res = await http.post(Uri.parse('http://192.168.0.16:8080/cliente'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(cliente));
    if(res.statusCode == 200){
      dynamic body = jsonDecode(res.body);
      Cliente cli = Cliente.fromJson(body);
      if(cli.idCliente != null){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }

  Future<bool> editarCliente(int id, Cliente cliente) async{
    http.Response res = await http.put(Uri.parse('http://192.168.0.16:8080/cliente/$id'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(cliente));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deletarCliente(int id) async{
    http.Response res = await http.delete(Uri.parse('http://192.168.0.16:8080/cliente/$id'));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}