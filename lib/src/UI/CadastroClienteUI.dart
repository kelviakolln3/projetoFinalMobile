import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../Controllers/CadastroClienteUIController.dart';

class CadastroClienteUI extends StatelessWidget {
  CadastroClienteUI({super.key});
  final maskCpf = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskDataNasc = MaskTextInputFormatter(mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')});
  final maskContato = MaskTextInputFormatter(mask: "(##)#####-####", filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    final cadastroClienteUIController = Get.put(CadastroClienteUIController());
    return WillPopScope(
      onWillPop: () async{
        Get.back(result: true);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF4169E1),
          title: const Text(
            "Cadastro Clientes",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => cadastroClienteUIController.btnSalvar(),
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFF4169E1),
          elevation: 5,
          child: const Icon(Icons.save_outlined, size: 25, color: Colors.white)
        ),
        body: Obx(() => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: const Color(0xFF4169E1),
                  style:const TextStyle(fontSize: 18, color: Colors.black),
                  controller: cadastroClienteUIController.nomeTextController,
                  onChanged: (value) => cadastroClienteUIController.validarCampos(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      errorText: cadastroClienteUIController.nomeErro.value == "" ? null : cadastroClienteUIController.nomeErro.value,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                      fillColor: const Color(0xFF4169E1),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                      labelText: 'Nome',
                      labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: const Color(0xFF4169E1),
                  style:const TextStyle(fontSize: 18, color: Colors.black),
                  controller: cadastroClienteUIController.emailTextController,
                  onChanged: (value) => cadastroClienteUIController.validarCampos(),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      errorText: cadastroClienteUIController.emailErro.value == "" ? null : cadastroClienteUIController.emailErro.value,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                      fillColor: const Color(0xFF4169E1),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                      labelText: 'E-mail',
                      labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  inputFormatters: [maskCpf],
                  cursorColor: const Color(0xFF4169E1),
                  style:const TextStyle(fontSize: 18, color: Colors.black),
                  controller: cadastroClienteUIController.cpfTextController,
                  onChanged: (value) => cadastroClienteUIController.validarCampos(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorText: cadastroClienteUIController.cpfErro.value == "" ? null : cadastroClienteUIController.cpfErro.value,
                    border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                    fillColor: const Color(0xFF4169E1),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    labelText: 'CPF',
                    labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: const Color(0xFF4169E1),
                  style:const TextStyle(fontSize: 18, color: Colors.black),
                  controller: cadastroClienteUIController.rgTextController,
                  onChanged: (value) => cadastroClienteUIController.validarCampos(),
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                    errorText: cadastroClienteUIController.rgErro.value == "" ? null : cadastroClienteUIController.rgErro.value,
                    border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                    fillColor: const Color(0xFF4169E1),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    labelText: 'RG',
                    labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  inputFormatters: [maskDataNasc],
                  cursorColor: const Color(0xFF4169E1),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  controller: cadastroClienteUIController.dataNascTextController,
                  onChanged: (value) => cadastroClienteUIController.validarCampos(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorText: cadastroClienteUIController.dataNascErro.value == "" ? null : cadastroClienteUIController.dataNascErro.value,
                    border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                    fillColor: const Color(0xFF4169E1),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    labelText: 'Data Nascimento',
                    labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  inputFormatters: [maskContato],
                  cursorColor: const Color(0xFF4169E1),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  controller: cadastroClienteUIController.contatoTextController,
                  onChanged: (value) => cadastroClienteUIController.validarCampos(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    errorText: cadastroClienteUIController.contatoErro.value == "" ? null : cadastroClienteUIController.contatoErro.value,
                    border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                    fillColor: const Color(0xFF4169E1),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    labelText: 'Contato',
                    labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: const Color(0xFF4169E1),
                  style:const TextStyle(fontSize: 18, color: Colors.black),
                  controller: cadastroClienteUIController.enderecoTextController,
                  onChanged: (value) => cadastroClienteUIController.validarCampos(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorText: cadastroClienteUIController.enderecoErro.value == "" ? null : cadastroClienteUIController.enderecoErro.value,
                    border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                    fillColor: const Color(0xFF4169E1),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                    labelText: 'Endereço',
                    labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                )
              ),
              
            ],
          ),
        )),
      ),
    );
  }
}