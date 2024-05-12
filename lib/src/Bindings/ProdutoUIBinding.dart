import 'package:get/get.dart';
import '../Controllers/ProdutoUIController.dart';

class ProdutoUIBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProdutoUIController>(ProdutoUIController());
  }
}