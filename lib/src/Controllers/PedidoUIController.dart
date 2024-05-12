import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Data/Models/Pedido.dart';
import '../Data/Repository/PedidoRepository.dart';
import '../UI/CadastroPedidoUI.dart';
import 'CadastroPedidoUIController.dart';

class PedidoUIController extends GetxController{
  PedidoRepository pedidoRepository = PedidoRepository();
  RxList<Pedido> pedidoList = <Pedido>[].obs;

  final cadastroPedidoUIController = Get.put(CadastroPedidoUIController());

  @override
  void onInit() {
    buscarPedidos();
    super.onInit();
  }

  buscarPedidos() async{
    pedidoList.value = await pedidoRepository.buscarPedidos();
  }

  btnInserir() async{
    bool ret = await Get.to(CadastroPedidoUI());
    if(ret){
      await buscarPedidos();
    }
  }

  btnDelete(Pedido pedido) async{
    bool ret = false;
    for (var i = 0; i < pedido.itemPedidoBeans!.length; i++) {
      ret = await pedidoRepository.deletarItensPedido(pedido.itemPedidoBeans![i].idItemPedido!);
    }
    ret = await pedidoRepository.deletarPedido(pedido.idPedido!);
    if(ret){
      await buscarPedidos();
    }
  }

  btnEditar(Pedido pedido) async{
    cadastroPedidoUIController.clienteTextController.text = pedido.idCliente.toString();
    cadastroPedidoUIController.dataEmissaoTextController.text = DateFormat('dd/MM/yyyy').format(DateTime.parse(pedido.dataCriacao));
    cadastroPedidoUIController.dropdownCondicaoValue.value = pedido.condicaoPagamento;
    cadastroPedidoUIController.dropdownFormaValue.value = pedido.formaPagamento;
    cadastroPedidoUIController.total.value = pedido.total;
    cadastroPedidoUIController.idPedido.value = pedido.idPedido!;
    cadastroPedidoUIController.itensPedidoList.value = pedido.itemPedidoBeans!;
    cadastroPedidoUIController.edicao.value = true;

    bool ret = await Get.to(CadastroPedidoUI());
    if(ret){
      await buscarPedidos();
    }
  }
}