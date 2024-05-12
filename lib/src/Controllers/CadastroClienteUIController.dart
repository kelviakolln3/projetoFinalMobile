import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Data/Models/Cliente.dart';
import '../Data/Repository/ClienteUIRepository.dart';

class CadastroClienteUIController extends GetxController{
  ClienteUIRepository clienteUIRepository = ClienteUIRepository();
  TextEditingController nomeTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController cpfTextController = TextEditingController();
  TextEditingController rgTextController = TextEditingController();
  TextEditingController dataNascTextController = TextEditingController();
  TextEditingController contatoTextController = TextEditingController();
  TextEditingController enderecoTextController = TextEditingController();
  
  RxString nomeErro = "".obs;
  RxString emailErro = "".obs;
  RxString cpfErro = "".obs;
  RxString rgErro = "".obs;
  RxString dataNascErro = "".obs;
  RxString contatoErro = "".obs;
  RxString enderecoErro = "".obs;

  RxBool edicao = false.obs;
  RxInt idCliente = 0.obs;

  validarCampos(){
    nomeErro.value = "";
    emailErro.value = "";
    cpfErro.value = "";
    rgErro.value = "";
    dataNascErro.value = "";
    contatoErro.value = "";
    enderecoErro.value = "";

    if(nomeTextController.text.isEmpty){
      nomeErro.value = "Campo não pode ser vazio";
    }
    if(emailTextController.text.isEmpty){
      emailErro.value = "Campo não pode ser vazio";
    }
    if(cpfTextController.text.isEmpty){
      cpfErro.value = "Campo não pode ser vazio";
    }
    if(rgTextController.text.isEmpty){
      rgErro.value = "Campo não pode ser vazio";
    }
    if(dataNascTextController.text.isEmpty){
      dataNascErro.value = "Campo não pode ser vazio";
    }
    if(contatoTextController.text.isEmpty){
      contatoErro.value = "Campo não pode ser vazio";
    }
    if(enderecoTextController.text.isEmpty){
      enderecoErro.value = "Campo não pode ser vazio";
    }
    
    if (!GetUtils.isCpf(cpfTextController.text)) {
      cpfErro.value  = "CPF inválido";
    }

    if (dataNascTextController.text.isNotEmpty) {
      var splitData = dataNascTextController.text.split("/");
      if(int.parse(splitData[0]) > 31) {
        dataNascErro.value  = "Data de Nascimento inválida";
      }else if(int.parse(splitData[1]) > 12) {
        dataNascErro.value  = "Data de Nascimento inválida";
      }else if(splitData[2] == "0000") {
        dataNascErro.value  = "Data de Nascimento inválida";
      }
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
    Cliente cliente = Cliente();
    var inputformat = DateFormat('dd/mm/yyyy');
    if((nomeErro.value == "") && (emailErro.value == "") && (cpfErro.value == "") && (rgErro.value == "")
    && (dataNascErro.value == "") && (contatoErro.value == "") && (enderecoErro.value == "")){
      if(idCliente.value > 0){
        cliente.idCliente = idCliente.value;
      }
      cliente.nome = nomeTextController.text;
      cliente.email = emailTextController.text;
      cliente.cpf = cpfTextController.text;
      cliente.rg = rgTextController.text;
      cliente.dataNasc = DateFormat('yyyy-MM-dd').format(inputformat.parse(dataNascTextController.text));
      cliente.contato = contatoTextController.text;
      cliente.endereco = enderecoTextController.text;

      if(edicao.value) {
        if(await clienteUIRepository.editarCliente(idCliente.value, cliente)){
          await showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return const AlertDialog(
                title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                content: Text("Cliente atualizado com sucesso!!", style: TextStyle(fontSize: 18)),
              );
            });
          Get.back(result: true);
        }
      }else{
        if(await clienteUIRepository.cadastrarCliente(cliente)){
          await showDialog(
            context: Get.context!,
            builder: (context) {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return const AlertDialog(
                title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                content: Text("Cliente cadastrado com sucesso!!", style: TextStyle(fontSize: 18)),
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