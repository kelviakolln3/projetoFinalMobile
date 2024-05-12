import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Data/Models/Produto.dart';
import '../Data/Repository/ProdutoUIRepository.dart';
import '../UI/CadastroProdutoUI.dart';
import 'CadastroProdutoUIController.dart';

class ProdutoUIController extends GetxController{
  ProdutoUIRepository produtoUIRepository = ProdutoUIRepository();
  RxList<Produto> produtoList = <Produto>[].obs;
  final cadastroProdutoUIController = Get.put(CadastroProdutoUIController());

  @override
  void onInit() {
    buscarProdutos();
    super.onInit();
  }
  
  buscarProdutos() async{
    produtoList.value = await produtoUIRepository.buscarProdutos();
  }

  btnInserir() async{
    bool ret = await Get.to(const CadastroProdutoUI());
    if(ret){
      await buscarProdutos();
    }
  }

  btnDelete(int id) async{
    bool ret = await produtoUIRepository.deletarProduto(id);
    if(ret){
      await buscarProdutos();
    }
  }

  btnEdit(Produto produto) async{
    cadastroProdutoUIController.nomeTextController.text = produto.nome;
    cadastroProdutoUIController.codigoBarrasTextController.text = produto.codigoBarras;
    cadastroProdutoUIController.estoqueTextController.text = produto.estoque.toString();
    cadastroProdutoUIController.grupoTextController.text = produto.grupo;
    cadastroProdutoUIController.marcaTextController.text = produto.marca;
    cadastroProdutoUIController.idProduto.value = produto.idProduto!;
    cadastroProdutoUIController.edicao.value = true;
    
    bool ret = await Get.to(const CadastroProdutoUI());
    if(ret){
      await buscarProdutos();
    }
  }
}