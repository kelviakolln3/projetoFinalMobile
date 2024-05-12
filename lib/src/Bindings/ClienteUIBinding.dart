import 'package:get/get.dart';

import '../Controllers/ClienteUIController.dart';

class ClienteUIBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ClienteUIController>(ClienteUIController());
  }
}