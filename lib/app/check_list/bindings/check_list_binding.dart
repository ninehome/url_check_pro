import 'package:get/get.dart';
import '../controllers/check_list_controller.dart';

class CheckListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckListController());
  }
}
