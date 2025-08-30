import 'package:get/get.dart';

import '../controller/check_domain_controller.dart';


class CheckDomainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CheckDomainController());
  }

}