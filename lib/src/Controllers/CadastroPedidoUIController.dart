import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Dados.dart';
import '../Data/Models/Pedido.dart';
import '../Data/Repository/PedidoRepository.dart';

class CadastroPedidoUIController extends GetxController{
  PedidoRepository pedidoRepository = PedidoRepository();
  TextEditingController clienteTextController = TextEditingController();
  TextEditingController dataEmissaoTextController = TextEditingController();
  TextEditingController produtoTextController = TextEditingController();
  TextEditingController quantidadeTextController = TextEditingController();
  TextEditingController unitarioTextController = TextEditingController();
  RxDouble total = 0.00.obs;
  RxList<String> listCondicao = ['A Vista', 'Débito', 'Crédito', '30 dias'].obs;
  RxList<String> listForma = ['Dinheiro', 'Cartão', 'Boleto', 'Pix'].obs;

  RxString dropdownCondicaoValue = "A Vista".obs;
  RxString dropdownFormaValue = "Dinheiro".obs;

  RxList<ItemPedidoBeans> itensPedidoList = <ItemPedidoBeans>[].obs;

  RxBool edicao = false.obs;
  RxInt idPedido = 0.obs;

  @override
  void onInit() {
    dropdownCondicaoValue.value = "A Vista";
    dropdownFormaValue.value = "Dinheiro";
    super.onInit();
  }

  btnAddItens(){
    ItemPedidoBeans itemPedido = ItemPedidoBeans(); 
    if(idPedido.value > 0){
      itemPedido.idItemPedido = idPedido.value;
    }
    itemPedido.idProduto = int.parse(produtoTextController.text);
    itemPedido.quantidade = double.parse(quantidadeTextController.text);
    itemPedido.valorUnitario = double.parse(unitarioTextController.text);
    itensPedidoList.add(itemPedido);
    total.value += double.parse(unitarioTextController.text) * double.parse(quantidadeTextController.text);
    produtoTextController.clear();
    quantidadeTextController.clear();
    unitarioTextController.clear();
  }

  btnSalvar() async{
    Pedido pedido = Pedido();
    var inputformat = DateFormat('dd/mm/yyyy');
    if(clienteTextController.text.isNotEmpty && dataEmissaoTextController.text.isNotEmpty && total.value > 0
    && dropdownCondicaoValue.value != "" && dropdownFormaValue.value != ""){
      if(itensPedidoList.isNotEmpty){
        if(idPedido.value > 0){
          pedido.idPedido = idPedido.value;
        }
        pedido.idCliente = int.parse(clienteTextController.text);
        pedido.idUsuario = Dados.usuario;
        pedido.dataCriacao = DateFormat('yyyy-MM-dd').format(inputformat.parse(dataEmissaoTextController.text));
        pedido.condicaoPagamento = dropdownCondicaoValue.value;
        pedido.formaPagamento = dropdownFormaValue.value;
        pedido.total = total.value;
        pedido.itemPedidoBeans = itensPedidoList;

        if(edicao.value){
          if(await pedidoRepository.editarPedido(pedido)){
            await showDialog(
              context: Get.context!,
              builder: (context) {
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.of(context).pop(true);
                });
                return const AlertDialog(
                  title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                  content: Text("Pedido atualizado com sucesso!!", style: TextStyle(fontSize: 18)),
                );
              });
            Get.back(result: true);
          }
        }else{
          if(await pedidoRepository.cadastrarPedido(pedido)){
            await showDialog(
              context: Get.context!,
              builder: (context) {
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.of(context).pop(true);
                });
                return const AlertDialog(
                  title: Text('Sucesso', style: TextStyle(color: Color(0xFF4169E1), fontSize: 22), textAlign: TextAlign.center),
                  content: Text("Pedido cadastrado com sucesso!!", style: TextStyle(fontSize: 18)),
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
          middleText: "Insira itens no pedido"
        );
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