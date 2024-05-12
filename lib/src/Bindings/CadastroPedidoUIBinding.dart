import 'package:get/get.dart';
import '../Controllers/CadastroPedidoUIController.dart';

class CadastroPedidoUIBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CadastroPedidoUIController>(CadastroPedidoUIController());
  }
}