import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../Controllers/FornecedorUIController.dart';
import '../Data/Models/Fornecedor.dart';
import '../Routes/AppRoutes.dart';

class FornecedorUI extends StatelessWidget {
  const FornecedorUI({super.key});

  @override
  Widget build(BuildContext context) {
    final fornecedorUIController = Get.put(FornecedorUIController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4169E1),
        title: const Text(
          "Fornecedores",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>  Get.toNamed(AppRoutes.cadastroForncecedorUI),
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF4169E1),
        elevation: 5,
        child: const Icon(Icons.add, size: 25, color: Colors.white)
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => fornecedorUIController.fornecedorList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
                  itemCount: fornecedorUIController.fornecedorList.length,
                  itemBuilder: (context, index) {
                    Fornecedor fornecedor = fornecedorUIController.fornecedorList[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) async{
                              await fornecedorUIController.btnDelete(fornecedor.idFornecedor!);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Deletar',
                          ),
                          SlidableAction(
                            onPressed: (context) async{
                              await fornecedorUIController.btnEdit(fornecedor);
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
                            title: Text(fornecedor.atividade, style: const TextStyle(fontSize: 18, color: Colors.black)),
                            subtitle: Text(fornecedor.empresa, style: const TextStyle(fontSize: 15, color: Colors.black)),
                            iconColor: Colors.black,
                            collapsedIconColor: Colors.black,
                            expandedAlignment: Alignment.topLeft,
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Contato: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: fornecedor.contato,
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
                                    text: 'Endereço: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: fornecedor.endereco,
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
                                    text: 'E-mail: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: fornecedor.email,
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