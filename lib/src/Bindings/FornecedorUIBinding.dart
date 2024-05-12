import 'package:get/get.dart';
import '../Controllers/FornecedorUIController.dart';

class FornecedorUIBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FornecedorUIController>(FornecedorUIController());
  }
}