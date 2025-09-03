
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../controller/check_photo_controller.dart';
class CheckPhotoView extends GetView<CheckPhotoController> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            //图片预览
            Container(
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: AssetImage(controller.galleryItems[index]),
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                      heroAttributes: PhotoViewHeroAttributes(tag: index),
                    );
                  },
                  itemCount: controller.galleryItems.length,
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        value: event == null
                            ? 0
                            : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                      ),
                    ),
                  ),
                  // backgroundDecoration: widget.backgroundDecoration,
                  pageController: controller.pageController,
                  onPageChanged: (index){
                    controller.onPageChanged(index);
                  },
                )
            ),

            //头部
            Column(
              children: [

                SizedBox(height: 30,),

                Stack(
                  children: [

                    Row(
                      children: [
                        SizedBox(width: 20),

                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_outlined, color: Colors.white),
                        ),

                      ],
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${controller.currentTag} / ${controller.galleryItems.length}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),

          ],
        ) ,
      );
    });
  }
}
