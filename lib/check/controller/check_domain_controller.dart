
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CheckDomainController extends GetxController{

  RxString url = "https://www.iconfont.cn/search/index?searchType=icon&g=%E7%AD%89%E5%BE%85&page=1&fromCollection=-1".obs ;

  RxInt type = 0.obs; //0 未选择 1正常 2：无法打开
  RxBool btnEnable = false.obs ;

  RxBool isOpen = false.obs ;


  final btn_all_not_select_decoration = BoxDecoration(
    border: BoxBorder.all(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(18),
  );

  final btn_not_select_decoration = BoxDecoration(
    color: Color(0xffdddddd),
    borderRadius: BorderRadius.circular(18),
  );

  final btn_select_decoration = BoxDecoration(
    color: Color(0xff006cff),
    borderRadius: BorderRadius.circular(18),
  );



  void openBrowser() {

  }

  void copy() {
    Clipboard.setData(ClipboardData(text: url.value));
  }

  void tapNormal() {
    type.value = 1 ;
  }

  void tapError() {
    type.value = 2 ;
  }

  BoxDecoration getNormalBtnDecoration() {

    BoxDecoration boxDecoration = BoxDecoration() ;
    if(type.value == 0){
      boxDecoration = btn_all_not_select_decoration ;
    }else if(type.value == 1){
      boxDecoration = btn_select_decoration ;
    }else if(type.value == 2){
      boxDecoration = btn_not_select_decoration ;
    }

    return boxDecoration ;
  }

  BoxDecoration getErrorBtnDecoration() {
    BoxDecoration boxDecoration = BoxDecoration() ;
    if(type.value == 0){
      boxDecoration = btn_all_not_select_decoration ;
    }else if(type.value == 1){
      boxDecoration = btn_not_select_decoration ;
    }else if(type.value == 2){
      boxDecoration = btn_select_decoration  ;
    }
    return boxDecoration ;
  }

  void addImg(BuildContext ctx) {

  }

  void uploadResult() {

  }

}