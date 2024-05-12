import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Routes/AppRoutes.dart';
import 'UI/LoginUI.dart';

class Projeto extends StatelessWidget {
  const Projeto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Projeto",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4169E1)),
        fontFamily: GoogleFonts.lato().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.login,
      home: const LoginUI(),
    );
  }
}