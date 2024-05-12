import 'package:get/get.dart';
import '../Controllers/PedidoUIController.dart';

class PedidoUIBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PedidoUIController>(PedidoUIController());
  }
}