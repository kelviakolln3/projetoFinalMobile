import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto/src/Routes/AppRoutes.dart';

class PrincipalUI extends StatelessWidget {
  const PrincipalUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4169E1),
        title: const Text("Projeto Aula", style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bem Vindo Fulano 🖐", style: TextStyle(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.clienteUI),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 194, 208, 248),
                            spreadRadius: 1,
                            blurRadius: 12
                        )],
                        border: Border.all(color: const Color(0xFF00008B), width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_outlined, size: 30, color: Color(0xFF00008B)),
                          Text("Clientes", style: TextStyle(fontSize: 20, color: Color(0xFF00008B)))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.produtoUI),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 194, 208, 248),
                            spreadRadius: 1,
                            blurRadius: 12
                        )],
                        border: Border.all(color: const Color(0xFF00008B), width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.trolley, size: 30, color: Color(0xFF00008B)),
                          Text("Produtos", style: TextStyle(fontSize: 20, color: Color(0xFF00008B)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.pedidoUI),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 194, 208, 248),
                            spreadRadius: 1,
                            blurRadius: 12
                        )],
                        border: Border.all(color: const Color(0xFF00008B), width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined, size: 30, color: Color(0xFF00008B)),
                          Text("Pedido", style: TextStyle(fontSize: 20, color: Color(0xFF00008B)))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.fornecedorUI),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 194, 208, 248),
                            spreadRadius: 1,
                            blurRadius: 12
                        )],
                        border: Border.all(color: const Color(0xFF00008B), width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.store_outlined, size: 30, color: Color(0xFF00008B)),
                          Text("Fornecedor", style: TextStyle(fontSize: 20, color: Color(0xFF00008B)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}