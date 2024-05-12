import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/Models/Fornecedor.dart';
import '../Data/Repository/FornecedorUIRepository.dart';

class CadastroFornecedorUIController extends GetxController{
  FornecedorUIRepository fornecedorUIRepository = FornecedorUIRepository();
  TextEditingController atividadeTextController = TextEditingController();
  TextEditingController empresaTextController = TextEditingController();
  TextEditingController contatoTextController = TextEditingController();
  TextEditingController enderecoTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();  
  
  RxString atividadeErro = "".obs;
  RxString empresaErro = "".obs;
  RxString contatoErro = "".obs;
  RxString enderecoErro = "".obs;
  RxString emailErro = "".obs;
  
  RxBool edicao = false.obs;
  RxInt idFornecedor = 0.obs;

  validarCampos(){
    atividadeErro.value = "";
    empresaErro.value = "";
    contatoErro.value = "";
    enderecoErro.value = "";
    emailErro.value = "";
    

    if(atividadeTextController.text.isEmpty){
      atividadeErro.value = "Campo não pode ser vazio";
    }
    if(empresaTextController.text.isEmpty){
      empresaErro.value = "Campo não pode ser vazio";
    }
    if(contatoTextController.text.isEmpty){
      contatoErro.value = "Campo não pode ser vazio";
    }
    if(enderecoTextController.text.isEmpty){
      enderecoErro.value = "Campo não pode ser vazio";
    }
    if(emailTextController.text.isEmpty){
      emailErro.value = "Campo não pode ser vazio";
    }

    if (emailTextController.text.isNotEmpty) {
      if(!emailTextController.text.contains("@")){
        emailErro.value = "E-mail inválido";
      }
    }

    if (!GetUtils.isPhoneNumber(contatoTextController.text)) {
      contatoErro.value  = "Número inválido";
    }
  }

  btnSalvar() async{
    Fornecedor fornecedor = Fornecedor();
    if((atividadeErro.value == "") && (empresaErro.value == "") && (contatoErro.value == "") && (enderecoErro.value == "")
    && (emailErro.value == "")){
      if(idFornecedor.value > 0){
        fornecedor.idFornecedor = idFornecedor.value;
      }
      fornecedor.atividade = atividadeTextController.text;
      fornecedor.empresa = empresaTextController.text;
      fornecedor.contato = contatoTextController.text;
      fornecedor.endereco = enderecoTextController.text;
      fornecedor.email = emailTextController.text;

      if(edicao.value) {
        if(await fornecedorUIRepository.editarFornecedor(idFornecedor.value, fornecedor)){
          await showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return const AlertDialog(
                title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                content: Text("Fornecedor atualizado com sucesso!!", style: TextStyle(fontSize: 18)),
              );
            });
          Get.back(result: true);
        }
      }else{
        if(await fornecedorUIRepository.cadastrarFornecedor(fornecedor)){
          await showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return const AlertDialog(
                title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                content: Text("Fornecedor cadastrado com sucesso!!", style: TextStyle(fontSize: 18)),
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