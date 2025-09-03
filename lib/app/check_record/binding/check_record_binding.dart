
import 'package:get/get.dart';

import '../controller/check_record_controller.dart';

class CheckRecordBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CheckRecordController);
  }

}