import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/Models/Produto.dart';
import '../Data/Repository/ProdutoUIRepository.dart';

class CadastroProdutoUIController extends GetxController{
  ProdutoUIRepository produtoUIRepository = ProdutoUIRepository();
  TextEditingController nomeTextController = TextEditingController();
  TextEditingController codigoBarrasTextController = TextEditingController();
  TextEditingController estoqueTextController = TextEditingController();
  TextEditingController grupoTextController = TextEditingController();
  TextEditingController marcaTextController = TextEditingController();

  RxString nomeErro = "".obs;
  RxString codigoBarrasErro = "".obs;
  RxString estoqueErro = "".obs;
  RxString grupoErro = "".obs;
  RxString marcaErro = "".obs;

  RxBool edicao = false.obs;
  RxInt idProduto = 0.obs;

  validarCampos(){
    nomeErro.value = "";
    codigoBarrasErro.value = "";
    estoqueErro.value = "";
    grupoErro.value = "";
    marcaErro.value = "";

    if(nomeTextController.text.isEmpty){
      nomeErro.value = "Campo não pode ser vazio";
    }
    if(codigoBarrasTextController.text.isEmpty){
      codigoBarrasErro.value = "Campo não pode ser vazio";
    }
    if(estoqueTextController.text.isEmpty){
      estoqueErro.value = "Campo não pode ser vazio";
    }
    if(grupoTextController.text.isEmpty){
      grupoErro.value = "Campo não pode ser vazio";
    }
    if(marcaTextController.text.isEmpty){
      marcaErro.value = "Campo não pode ser vazio";
    }
  }

  btnSalvar() async{
    Produto produto = Produto();
    if((nomeErro.value == "") && (codigoBarrasErro.value == "") && (estoqueErro.value == "") && (grupoErro.value == "")
    && (marcaErro.value == "")){
      if(idProduto.value > 0){
        produto.idProduto = idProduto.value;
      }
      produto.nome = nomeTextController.text;
      produto.codigoBarras = codigoBarrasTextController.text;
      produto.estoque = double.parse(estoqueTextController.text);
      produto.grupo = grupoTextController.text;
      produto.marca = marcaTextController.text;

      if(edicao.value) {
        if(await produtoUIRepository.editarProduto(idProduto.value, produto)){
          await showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return const AlertDialog(
                title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                content: Text("Produto atualizado com sucesso!!", style: TextStyle(fontSize: 18)),
              );
            });
          Get.back(result: true);
        }
      }else{
        
        if(await produtoUIRepository.cadastrarProduto(produto)){
          await showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return const AlertDialog(
                title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                content: Text("Produto cadastrado com sucesso!!", style: TextStyle(fontSize: 18)),
              );
            });
          Get.back(result: true);
        }
      }
    }else{
      Get.defaultDialog(
        backgroundColor: Colors.white,
        title: "Aviso",
        titleStyle: const TextStyle(color: Color(0xFF4169E1), fontSize: 22),
        middleTextStyle: const TextStyle(fontSize: 18),
        middleText: "Campos incorretos ou vazios\nVerifique!"
      );
    }
  }
}