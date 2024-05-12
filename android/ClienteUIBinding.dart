import 'package:get/get.dart';
import 'ClienteUIController.dart';

class ClienteUIBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ClienteUIController>(ClienteUIController());
  }
}