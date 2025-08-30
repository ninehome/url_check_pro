import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common_widgets/toast_utils.dart';


class LoginController extends GetxController {
  var countryCode = "86".obs;
  var timeStr = "获取验证码".obs;
  Timer? timer;
  var timeCount = 60.obs;
  var isAgree = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  var canLogin = false.obs;


  @override
  void onInit() {
    super.onInit();
  }


  Future<void> reSendSms(String phone) async {

  }

  void toAgreementPage() {

  }

  void toPrivacyPage() {

  }

  void checkLogin() {
    if (phoneController.text.isNotEmpty && codeController.text.isNotEmpty) {
      canLogin.value =  true;
    } else {
      canLogin.value = false;
    }
    canLogin.refresh();
  }

  void login() async {


    if (phoneController.text == "") {
      DialogUtils.showToast('请输入用户手机号');
      return;
    }

    if (codeController.text == "") {
      DialogUtils.showToast('请输入短信验证码');
      return;
    }


    Map<String, dynamic> params = {
      'phone': phoneController.text,
      'regionCode' : countryCode.value,
      'appType' : 1,
      'code': codeController.text,
    };


  }



  @override
  void onClose() {
    // TODO: implement dispose
    if(timer != null){
      timer?.cancel();
      timer = null;
    }
    super.onClose();
  }
}