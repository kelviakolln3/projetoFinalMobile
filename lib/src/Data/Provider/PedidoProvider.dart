import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/Pedido.dart';

class PedidoProvider {
  Future<List<Pedido>> buscarPedidos() async {
    List<Pedido> pedidos = [];
    http.Response res = await http.get(Uri.parse('http://192.168.0.16:8080/pedido/get-all-bean'));
    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      pedidos = body.map((dynamic item) => Pedido.fromJson(item)).toList();
    }
    return pedidos;
  }

  Future<bool> cadastrarPedido(Pedido pedido) async{
    print(jsonEncode(pedido));
    http.Response res = await http.post(Uri.parse('http://192.168.0.16:8080/pedido/inserir-pedido'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(pedido));
    if(res.statusCode == 200){
      dynamic body = jsonDecode(res.body);
      Pedido ped = Pedido.fromJson(body);
      if(ped.idPedido != null){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }

  Future<bool> editarPedido(Pedido pedido) async{
    http.Response res = await http.post(Uri.parse('http://192.168.0.16:8080/pedido/inserir-pedido'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(pedido));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deletarPedido(int id) async{
    http.Response res = await http.delete(Uri.parse('http://192.168.0.16:8080/pedido/$id'));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deletarItensPedido(int id) async{
    http.Response res = await http.delete(Uri.parse('http://192.168.0.16:8080/item-pedido/$id'));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}