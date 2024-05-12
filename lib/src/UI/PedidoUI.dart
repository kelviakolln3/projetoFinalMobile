import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controllers/PedidoUIController.dart';
import '../Data/Models/Pedido.dart';
import '../Routes/AppRoutes.dart';

class PedidoUI extends StatelessWidget {
  const PedidoUI({super.key});

  @override
  Widget build(BuildContext context) {
    final pedidoUIController = Get.put(PedidoUIController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4169E1),
        title: const Text(
          "Pedidos",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.cadastroPedidoUI),
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF4169E1),
        elevation: 5,
        child: const Icon(Icons.add, size: 25, color: Colors.white)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => pedidoUIController.pedidoList.isNotEmpty
          ? ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
            itemCount: pedidoUIController.pedidoList.length,
            itemBuilder: (context, index) {
              Pedido pedido = pedidoUIController.pedidoList[index];
              return Slidable(
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async{
                        await pedidoUIController.btnDelete(pedido);
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Deletar',
                    ),
                    SlidableAction(
                      onPressed: (context) async{
                        await pedidoUIController.btnEditar(pedido);
                      },
                      backgroundColor: const Color(0xFF4169E1),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Editar',
                    ),
                  ]
                ),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFF4169E1),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      shape: const Border(),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Número: ',
                              style: const TextStyle(fontSize: 18, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "${pedido.idPedido}",
                                  style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal)
                                )
                              ]
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Total : ',
                              style: const TextStyle(fontSize: 18, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "R\$ ${pedido.total}",
                                  style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal)
                                )
                              ]
                            ),
                          ),
                        ],
                      ),
                      iconColor: Colors.black,
                      collapsedIconColor: Colors.black,
                      expandedAlignment: Alignment.topLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Cliente: ',
                              style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "${pedido.idCliente}",
                                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                                )
                              ]
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Data: ',
                              style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: DateFormat("dd/MM/yyyy").format(DateTime.parse(pedido.dataCriacao)),
                                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                                )
                              ]
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Condição Pagamento: ',
                              style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: pedido.condicaoPagamento,
                                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                                )
                              ]
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Forma Pagamento: ',
                              style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: pedido.formaPagamento,
                                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                                )
                              ]
                            ),
                          ),
                        )
                      ],
                    ), 
                  ),
                )
              );
            }
          ) : Container()
        ),
      ),
    );
  }
}