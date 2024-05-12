import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../Controllers/CadastroFornecedorUIController.dart';

class CadastroFornecedorUI extends StatelessWidget {
  CadastroFornecedorUI({super.key});
  final maskContato = MaskTextInputFormatter(mask: "(##)#####-####", filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    final cadastroFornecedorUIController = Get.put(CadastroFornecedorUIController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4169E1),
        title: const Text(
          "Cadastro Fornecedor",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cadastroFornecedorUIController.btnSalvar(),
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
                controller: cadastroFornecedorUIController.atividadeTextController,
                onChanged: (value) => cadastroFornecedorUIController.validarCampos(),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorText: cadastroFornecedorUIController.atividadeErro.value == "" ? null : cadastroFornecedorUIController.atividadeErro.value,
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
                    labelText: 'Atividade',
                    labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: const Color(0xFF4169E1),
                style:const TextStyle(fontSize: 18, color: Colors.black),
                controller: cadastroFornecedorUIController.empresaTextController,
                onChanged: (value) => cadastroFornecedorUIController.validarCampos(),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    errorText: cadastroFornecedorUIController.empresaErro.value == "" ? null : cadastroFornecedorUIController.empresaErro.value,
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
                    labelText: 'Empresa',
                    labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                inputFormatters: [maskContato],
                cursorColor: const Color(0xFF4169E1),
                style:const TextStyle(fontSize: 18, color: Colors.black),
                controller: cadastroFornecedorUIController.contatoTextController,
                onChanged: (value) => cadastroFornecedorUIController.validarCampos(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: cadastroFornecedorUIController.contatoErro.value == "" ? null : cadastroFornecedorUIController.contatoErro.value,
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
                controller: cadastroFornecedorUIController.enderecoTextController,
                onChanged: (value) => cadastroFornecedorUIController.validarCampos(),
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                  errorText: cadastroFornecedorUIController.enderecoErro.value == "" ? null : cadastroFornecedorUIController.enderecoErro.value,
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
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: const Color(0xFF4169E1),
                style: const TextStyle(fontSize: 18, color: Colors.black),
                controller: cadastroFornecedorUIController.emailTextController,
                onChanged: (value) => cadastroFornecedorUIController.validarCampos(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: cadastroFornecedorUIController.emailErro.value == "" ? null : cadastroFornecedorUIController.emailErro.value,
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
          ],
        ),
      )),
    );
  }
}