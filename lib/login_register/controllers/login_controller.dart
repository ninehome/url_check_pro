import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled2/routers/app_routers.dart';

import '../../common_widgets/toast_utils.dart';


class LoginController extends GetxController {
  var topLogo = "assets/images/top_left_logo.png".obs;

  final title = "登录账号".obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();



  @override
  void onInit() {
    super.onInit();
  }




  void login() async {




    Get.toNamed(AppRouter.checkListView);


  }



  @override
  void onClose() {

    super.onClose();
  }
}