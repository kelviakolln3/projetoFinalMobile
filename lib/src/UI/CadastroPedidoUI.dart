import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../Controllers/CadastroPedidoUIController.dart';
import '../Data/Models/Pedido.dart';

class CadastroPedidoUI extends StatelessWidget {
  final maskDataEmissao = MaskTextInputFormatter(mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')});
  CadastroPedidoUI({super.key});

  @override
  Widget build(BuildContext context) {
    final cadastroPedidoUIController = Get.put(CadastroPedidoUIController());
    return WillPopScope(
      onWillPop: () async{
        Get.back(result: true);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF4169E1),
          title: const Text(
            "Cadastro Pedido",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => cadastroPedidoUIController.btnSalvar(),
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFF4169E1),
          elevation: 5,
          child: const Icon(Icons.save_outlined, size: 25, color: Colors.white)
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        cursorColor: const Color(0xFF4169E1),
                        style:const TextStyle(fontSize: 18, color: Colors.black),
                        controller: cadastroPedidoUIController.clienteTextController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                            fillColor: Color(0xFF4169E1),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                            labelText: 'Cliente *',
                            labelStyle: TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        inputFormatters: [maskDataEmissao],
                        cursorColor: const Color(0xFF4169E1),
                        style:const TextStyle(fontSize: 18, color: Colors.black),
                        controller: cadastroPedidoUIController.dataEmissaoTextController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                            fillColor: Color(0xFF4169E1),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                            labelText: 'Data Emissão *',
                            labelStyle: TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                      )
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF4169E1), width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(90.0)),
                        ),
                        child: DropdownButton<String>(
                          value: cadastroPedidoUIController.dropdownCondicaoValue.value,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFF4169E1), fontSize: 18),
                          underline: const SizedBox(),
                          onChanged: (String? value) {
                            cadastroPedidoUIController.dropdownCondicaoValue.value = value!;
                          },
                          items: cadastroPedidoUIController.listCondicao.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ))
                  ),
                  Expanded(
                    child: Obx(() => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF4169E1), width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(90.0)),
                        ),
                        child: DropdownButton<String>(
                          value: cadastroPedidoUIController.dropdownFormaValue.value,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFF4169E1), fontSize: 18),
                          underline: const SizedBox(),
                          onChanged: (String? value) {
                            cadastroPedidoUIController.dropdownFormaValue.value = value!;
                          },
                          items: cadastroPedidoUIController.listForma.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ))
                  )
                ],
              ),
              Obx(() => Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          text: 'Total R\$: ',
                          style: const TextStyle(fontSize: 18, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: cadastroPedidoUIController.total.toStringAsFixed(2),
                              style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal)
                            )
                          ]
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              //Conteiner que contem os itens do pedido
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                cursorColor: const Color(0xFF4169E1),
                                style:const TextStyle(fontSize: 18, color: Colors.black),
                                controller: cadastroPedidoUIController.produtoTextController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                                    fillColor: Color(0xFF4169E1),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                                    labelText: 'Produto *',
                                    labelStyle: TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                              )
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                cursorColor: const Color(0xFF4169E1),
                                style:const TextStyle(fontSize: 18, color: Colors.black),
                                controller: cadastroPedidoUIController.quantidadeTextController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                                    fillColor: Color(0xFF4169E1),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                        borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                                    labelText: 'Quantidade *',
                                    labelStyle: TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                              )
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          cursorColor: const Color(0xFF4169E1),
                          style:const TextStyle(fontSize: 18, color: Colors.black),
                          controller: cadastroPedidoUIController.unitarioTextController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 25)),
                              fillColor: Color(0xFF4169E1),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(color: Color(0xFF4169E1), width: 1.2)),
                              labelText: 'Unitário *',
                              labelStyle: TextStyle(fontSize: 18, color: Color(0xFF4169E1)))
                        )
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () => cadastroPedidoUIController.btnAddItens(), 
                          icon: const Icon(Icons.add, size: 25, color: Color(0xFF4169E1)))
                      )
                    ],
                  ),
                ),
              ),
              cadastroPedidoUIController.itensPedidoList.isNotEmpty?
              const Center(
                child: Text("Itens do pedido", style: TextStyle(fontSize: 18, color: Color(0xFF4169E1), fontWeight: FontWeight.bold))
              ): Container(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Obx(() => cadastroPedidoUIController.itensPedidoList.isNotEmpty
                  ? ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
                    itemCount: cadastroPedidoUIController.itensPedidoList.length,
                    itemBuilder: (context, index) {
                      ItemPedidoBeans itensPedido = cadastroPedidoUIController.itensPedidoList[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: ListTile(
                          title: Text("Produto: ${itensPedido.idProduto}", style: const TextStyle(fontSize: 18, color: Color(0xFF4169E1), fontWeight: FontWeight.bold)),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Quantidade: ',
                                  style: const TextStyle(fontSize: 18, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${itensPedido.quantidade}",
                                      style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal)
                                    )
                                  ]
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Unitário: ',
                                  style: const TextStyle(fontSize: 18, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${itensPedido.valorUnitario}",
                                      style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal)
                                    )
                                  ]
                                ),
                              ),
                            ],
                          )
                        ),
                      );
                    })
                  : Container()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}