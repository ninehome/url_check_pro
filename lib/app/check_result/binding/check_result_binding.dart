import 'package:get/get.dart';

import '../controller/check_result_controller.dart';
class CheckResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckResultController());
  }

}