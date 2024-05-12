import 'dart:convert';

import '../Models/Fornecedor.dart';
import 'package:http/http.dart' as http;

class FornecedorProvider{
  Future<List<Fornecedor>> buscarFornecedores() async {
    List<Fornecedor> fornecedores = [];
    http.Response res = await http.get(Uri.parse('http://192.168.0.16:8080/fornecedor'));
    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      fornecedores = body.map((dynamic item) => Fornecedor.fromJson(item)).toList();
    }
    return fornecedores;
  }

  Future<bool> cadastrarFornecedor(Fornecedor fornecedor) async{
    http.Response res = await http.post(Uri.parse('http://192.168.0.16:8080/fornecedor'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(fornecedor));
    if(res.statusCode == 200){
      dynamic body = jsonDecode(res.body);
      Fornecedor forne = Fornecedor.fromJson(body);
      if(forne.idFornecedor != null){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }
 
  Future<bool> editarFornecedor(int id, Fornecedor fornecedor) async{
    http.Response res = await http.put(Uri.parse('http://192.168.0.16:8080/fornecedor/$id'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(fornecedor));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deletarFornecedor(int id) async{
    http.Response res = await http.delete(Uri.parse('http://192.168.0.16:8080/fornecedor/$id'));
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}