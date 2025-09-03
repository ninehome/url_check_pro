
import 'package:flutter/src/widgets/page_view.dart';
import 'package:get/get.dart';

class CheckPhotoController extends GetxController{


  RxInt currentTag = 1.obs;

  var pageController = PageController(
    initialPage: 0,
  );

  var galleryItems = [
    "assets/images/test.png",
    "assets/images/test.png",
    "assets/images/test.png",
    "assets/images/test.png",
    "assets/images/test.png",
    "assets/images/test.png",
    "assets/images/test.png",
    "assets/images/test.png",
    "assets/images/test.png",
  ];

  void onPageChanged(int index) {
    currentTag.value = index + 1 ;
  }



}