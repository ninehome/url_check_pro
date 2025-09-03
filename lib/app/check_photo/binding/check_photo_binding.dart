import 'package:get/get.dart';

import '../controller/check_photo_controller.dart';
class CheckPhotoBinding extends Bindings{
  @override
  void dependencies() {
     Get.put(CheckPhotoController());
  }

}