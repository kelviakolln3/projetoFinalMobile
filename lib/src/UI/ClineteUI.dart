import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../Controllers/ClienteUIController.dart';
import '../Data/Models/Cliente.dart';

class ClienteUI extends StatelessWidget {
  const ClienteUI({super.key});

  @override
  Widget build(BuildContext context) {
    final clienteUIController = Get.put(ClienteUIController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4169E1),
        title: const Text(
          "Clientes",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => clienteUIController.btnInserir(),
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF4169E1),
        elevation: 5,
        child: const Icon(Icons.add, size: 25, color: Colors.white)
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => clienteUIController.clienteList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
                  itemCount: clienteUIController.clienteList.length,
                  itemBuilder: (context, index) {
                    Cliente cliente = clienteUIController.clienteList[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) async{
                              await clienteUIController.btnDelete(cliente.idCliente!);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Deletar',
                          ),
                          SlidableAction(
                            onPressed: (context) async{
                              await clienteUIController.btnEdit(cliente);
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
                            title: Text(cliente.nome, style: const TextStyle(fontSize: 18, color: Colors.black)),
                            subtitle: Text(cliente.email, style: const TextStyle(fontSize: 15, color: Colors.black)),
                            iconColor: Colors.black,
                            collapsedIconColor: Colors.black,
                            expandedAlignment: Alignment.topLeft,
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'CPF: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: cliente.cpf,
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
                                    text: 'RG: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: cliente.rg,
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
                                    text: 'Contato: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: cliente.contato,
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
                                    text: 'Data Nascimento: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: DateFormat("dd/MM/yyyy").format(DateTime.parse(cliente.dataNasc)),
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
                                    text: 'Endereco : ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: cliente.endereco,
                                        style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                                      )
                                    ]
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container())),
    );
  }
}
