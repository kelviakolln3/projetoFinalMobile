import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/Produto.dart';

class ProdutoProvider{
  Future<List<Produto>> buscarProdutos() async {
    List<Produto> produtos = [];
    http.Response res = await http.get(Uri.parse('http://192.168.0.16:8080/produto'));
    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      produtos = body.map((dynamic item) => Produto.fromJson(item)).toList();
    }
    return produtos;
  }

  Future<bool> cadastrarProduto(Produto produto) async{
    http.Response res = await http.post(Uri.parse('http://192.168.0.16:8080/produto'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(produto));
    if(res.statusCode == 200){
      dynamic body = jsonDecode(res.body);
      Produto prod = Produto.fromJson(body);
      if(prod.idProduto != null){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }

  Future<bool> editarProduto(int id, Produto produto) async{
    http.Response res = await http.put(Uri.parse('http://192.168.0.16:8080/produto/$id'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(produto));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deletarProduto(int id) async{
    http.Response res = await http.delete(Uri.parse('http://192.168.0.16:8080/produto/$id'));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}