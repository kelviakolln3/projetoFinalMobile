import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:projeto/src/Routes/AppRoutes.dart';
import '../Controllers/ProdutoUIController.dart';
import '../Data/Models/Produto.dart';

class ProdutoUI extends StatelessWidget {
  const ProdutoUI({super.key});

  @override
  Widget build(BuildContext context) {
    final produtoUIController = Get.put(ProdutoUIController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4169E1),
        title: const Text(
          "Produtos",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>  Get.toNamed(AppRoutes.cadastroProdutoUI),
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF4169E1),
        elevation: 5,
        child: const Icon(Icons.add, size: 25, color: Colors.white)
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => produtoUIController.produtoList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
                  itemCount: produtoUIController.produtoList.length,
                  itemBuilder: (context, index) {
                    Produto produto = produtoUIController.produtoList[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) async{
                              produtoUIController.btnDelete(produto.idProduto!);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Deletar',
                          ),
                          SlidableAction(
                            onPressed: (context) async{
                              produtoUIController.btnEdit(produto);
                            },
                            backgroundColor: const Color(0xFF4169E1),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Editar',
                          ),
                        ]
                      ),
                      /* endActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            icon: Icons.pallet,
                            label: 'Acerto de Estoque',
                          ),
                        ]
                      ), */
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
                            title: Text(produto.nome, style: const TextStyle(fontSize: 18, color: Colors.black)),
                            iconColor: Colors.black,
                            collapsedIconColor: Colors.black,
                            expandedAlignment: Alignment.topLeft,
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Código de Barras: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: produto.codigoBarras,
                                        style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                                      )
                                    ]
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Estoque: ',
                                        style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '${produto.estoque}',
                                            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)
                                          )
                                        ]
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Grupo: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: produto.grupo,
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
                                    text: 'Marca: ',
                                    style: const TextStyle(fontSize: 16, color: Color(0xFF4169E1), fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: produto.marca,
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