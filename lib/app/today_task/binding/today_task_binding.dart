
import 'package:get/get.dart';

import '../controller/today_task_controller.dart';

class TodayTaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TodayTaskController);
  }

}