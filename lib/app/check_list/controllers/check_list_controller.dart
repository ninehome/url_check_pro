
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CheckListController extends GetxController with GetTickerProviderStateMixin{



  final topLeftLogo = "assets/images/top_left_logo.png".obs;
  final RxList dataList = [].obs;
  final  rechargeObject ={}.obs;


  List icons = ["assets/scale/recharge/icon_trc.png", "assets/scale/recharge/icon_binance.png", "assets/scale/recharge/icon_oe.png", "assets/scale/recharge/icon_bank.png"];
  List names = ["TRC20", "币安买币", "欧易买币", "商家买币"];


  ScrollController scrollController = ScrollController();
  final count = 0.obs;

  final indexNumber = 0.obs;
   late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    dataList.add({
      "img":icons[0],
      "title":names[0],
      "choice":false,

    });
    dataList.add({
      "img":icons[1],
      "title":names[1],
      "choice":false,

    });
    super.onInit();
  }



  void toAgreementPage() {

  }



  void itemOnClick(index){

    if(index ==0){
      double minxScrollExtent = scrollController.position.minScrollExtent;
      scrollController.animateTo(
        minxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,  // 平滑滚动
      );

    }else if(index ==3){
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      scrollController.animateTo(
        maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,  // 平滑滚动
      );
    }




    for(int i=0;i<dataList.length;i++){
      dataList[i]['choice'] = false;
    }


    dataList[index]['choice'] = true;
    dataList.refresh();
    tabController.animateTo(index);

  }

  @override
  void onClose() {

    super.onClose();
  }
}