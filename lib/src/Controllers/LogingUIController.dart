import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Dados.dart';
import '../Data/Repository/LoginRepository.dart';
import '../Routes/AppRoutes.dart';
class LogingUIController extends GetxController {
 LoginRepository loginRepository = LoginRepository();
 TextEditingController usuarioTextController = TextEditingController();
 TextEditingController senhaTextController = TextEditingController();

 RxBool hidePassword = true.obs;
 RxString erroLogin = "".obs;

 login() async{
  erroLogin.value = "";
  if(usuarioTextController.text.isNotEmpty && senhaTextController.text.isNotEmpty){
    int id = int.parse(usuarioTextController.text);
    String senha = senhaTextController.text;
    if(await loginRepository.login(id, senha)){
      Dados.usuario = id;
      Get.toNamed(AppRoutes.principalUI);
    }else{
      erroLogin.value = "Usuário ou senha inválidos verifique!";
    }
  }else if(usuarioTextController.text.isEmpty){
    erroLogin.value = "Informe o usuário";
  }else if(senhaTextController.text.isEmpty){
    erroLogin.value = "Informe a senha";
  }
 }
}