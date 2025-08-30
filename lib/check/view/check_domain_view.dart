
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/check_domain_controller.dart';
import '../widget/value_btn_widget.dart';


class CheckDomainView extends GetView<CheckDomainController>{

  final common_box_decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final common_gray_box_decoration = BoxDecoration(
    color: Color(0xfff5f5f5),
    borderRadius: BorderRadius.circular(10),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff006cff),
        leading: InkWell(onTap: (){
          Get.back();
        },child: Icon(Icons.arrow_back_outlined,color: Colors.white,),),
        title: Text('检测域名',style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
      body: SafeArea(
          child: Obx((){
            return Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: common_box_decoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 头部内容
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text('检测流程',style: TextStyle(color: Color(0xff006cff),fontSize: 20 ),),

                          const SizedBox(height: 10,),

                          const Text('第一步：\n点击打开跳转默认浏览器，或复制域名前往指定浏览器打开当前检测域名',style: TextStyle(color: Colors.black,fontSize: 14 ),),

                          const SizedBox(height: 10,),

                          ///url
                          Container(
                            decoration: common_gray_box_decoration,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(controller.url.value,
                                  style: TextStyle(color: Color(0xffff7f00),fontSize: 14 ),
                                ),

                                const SizedBox(height: 10,),

                                Row(
                                  children: [

                                    InkWell(
                                      onTap: (){
                                        controller.openBrowser();
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xff006cff),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('打开',style: TextStyle(color: Colors.white,fontSize: 12),),
                                            const SizedBox(width: 2,),
                                            Image.asset('assets/images/img_check_open.png',width: 10,),
                                          ],
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 10,),

                                    InkWell(
                                      onTap: (){
                                        controller.copy();
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: BoxBorder.all(
                                            color: Color(0xff006cff),
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('复制',style: TextStyle(color: Color(0xff006cff),fontSize: 12),),
                                            const SizedBox(width: 2,),
                                            Image.asset('assets/images/img_check_copy.png',width: 10,),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10,),

                          const Text('第二步：\n根据域名在浏览器打开情况,选择域名健康状态',style: TextStyle(color: Colors.black,fontSize: 14 ),),

                          const SizedBox(height: 10,),

                          // 按钮选择
                          Row(
                            children: [

                              Expanded(
                                  child:  InkWell(
                                    onTap: (){
                                      controller.tapNormal();
                                    },
                                    child: Container(
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: controller.getNormalBtnDecoration(),
                                      child: Text('正常打开',style: TextStyle(color: controller.type.value == 0 ?Color(0xff006cff) : Colors.white,fontSize: 12),),
                                    ),
                                  ),
                              ),

                              const SizedBox(width: 20,),

                              Expanded(
                                child:  InkWell(
                                  onTap: (){
                                    controller.tapError();
                                  },
                                  child: Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration:controller.getErrorBtnDecoration(),
                                    child: Text('无法打开',style: TextStyle(color: controller.type.value == 0 ?Color(0xff006cff) : Colors.white,fontSize: 12),),
                                  ),
                                ),
                              ),

                            ],
                          ),

                          const SizedBox(height: 10,),

                          const Text('第三步：\n上传检测结果截图',style: TextStyle(color: Colors.black,fontSize: 14 ),),
                          const Text('需要在不同浏览器检测时，需一次上传各浏览器的检测截图',style: TextStyle(color: Colors.grey,fontSize: 11 ),),

                          const SizedBox(height: 10,),

                          Container(
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 100,
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  //横轴元素个数
                                    crossAxisCount: 4,
                                    //纵轴间距
                                    mainAxisSpacing: 10.0,
                                    //横轴间距
                                    crossAxisSpacing: 10.0,
                                    //子组件宽高长度比例
                                    childAspectRatio: 1
                                ),
                                itemBuilder: (ctx,index){
                                  // if(index == 0){
                                  return InkWell(
                                    onTap: (){
                                      controller.addImg(ctx);
                                    },
                                    child: Image.asset('assets/images/img_check_upload.png',width: 100,),
                                  );
                                  // }
                                }
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  ///上传按钮
                  ValueBtnWidget(
                      btnName: "上传结果",
                      enable: controller.btnEnable.value,
                      onTap: (){
                        controller.uploadResult();
                      }
                  ),

                ],
              ),
            );
          }),
      ),
    );
  }
  
}