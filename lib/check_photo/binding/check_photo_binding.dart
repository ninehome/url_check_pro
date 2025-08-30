import 'package:get/get.dart';
import 'package:untitled2/check_photo/controller/check_photo_controller.dart';

class CheckPhotoBinding extends Bindings{
  @override
  void dependencies() {
     Get.put(CheckPhotoController());
  }

}