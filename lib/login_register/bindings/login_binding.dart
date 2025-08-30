import 'package:get/get.dart';

import '../controllers/login_controller.dart';


class ServiceWebKfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
