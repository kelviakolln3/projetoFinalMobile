import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/CadastroProdutoUIController.dart';

class CadastroProdutoUI extends StatelessWidget {
  const CadastroProdutoUI({super.key});
  @override
  Widget build(BuildContext context) {
    final cadastroProdutoUIController = Get.put(CadastroProdutoUIController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4169E1),
        title: const Text(
          "Cadastro Produtos",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cadastroProdutoUIController.btnSalvar(),
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
                controller: cadastroProdutoUIController.nomeTextController,
                onChanged: (value) => cadastroProdutoUIController.validarCampos(),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorText: cadastroProdutoUIController.nomeErro.value == "" ? null : cadastroProdutoUIController.nomeErro.value,
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
                controller: cadastroProdutoUIController.codigoBarrasTextController,
                onChanged: (value) => cadastroProdutoUIController.validarCampos(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: cadastroProdutoUIController.codigoBarrasErro.value == "" ? null : cadastroProdutoUIController.codigoBarrasErro.value,
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
                  labelText: 'Código de Barras',
                  labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: const Color(0xFF4169E1),
                style:const TextStyle(fontSize: 18, color: Colors.black),
                controller: cadastroProdutoUIController.estoqueTextController,
                onChanged: (value) => cadastroProdutoUIController.validarCampos(),
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  errorText: cadastroProdutoUIController.estoqueErro.value == "" ? null : cadastroProdutoUIController.estoqueErro.value,
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
                  labelText: 'Estoque',
                  labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: const Color(0xFF4169E1),
                style:const TextStyle(fontSize: 18, color: Colors.black),
                controller: cadastroProdutoUIController.grupoTextController,
                onChanged: (value) => cadastroProdutoUIController.validarCampos(),
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                  errorText: cadastroProdutoUIController.grupoErro.value == "" ? null : cadastroProdutoUIController.grupoErro.value,
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
                  labelText: 'Grupo',
                  labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: const Color(0xFF4169E1),
                style:const TextStyle(fontSize: 18, color: Colors.black),
                controller: cadastroProdutoUIController.marcaTextController,
                onChanged: (value) => cadastroProdutoUIController.validarCampos(),
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                  errorText: cadastroProdutoUIController.marcaErro.value == "" ? null : cadastroProdutoUIController.marcaErro.value,
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
                  labelText: 'Marca',
                  labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
              )
            ),
          ],
        ),
      )),
    );
  }
}