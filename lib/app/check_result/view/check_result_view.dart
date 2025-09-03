
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/check_result_controller.dart';

class CheckResultView extends GetView<CheckResultController>{

  final common_box_decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final common_gray_box_decoration = BoxDecoration(
    color: Color(0xfff5f5f5),
    borderRadius: BorderRadius.circular(10),
  );


  final btn_not_select_decoration = BoxDecoration(
    color: Color(0xffdddddd),
    borderRadius: BorderRadius.circular(18),
  );

  final btn_select_decoration = BoxDecoration(
    color: Color(0xff006cff),
    borderRadius: BorderRadius.circular(18),
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
        title: Text('查看结果',style: TextStyle(color: Colors.white,fontSize: 18),),
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

                          const Text('检测域名',style: TextStyle(color: Colors.black,fontSize: 14 ),),

                          const SizedBox(height: 10,),

                          ///url
                          Container(
                            decoration: common_gray_box_decoration,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("https://www.iconfont.cn/search/index?searchType=icon&g=%E7%AD%89%E5%BE%85&page=1&fromCollection=-1",
                                  style: TextStyle(color: Color(0xffff7f00),fontSize: 14 ),
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(height: 10,),

                          const Text('域名状态',style: TextStyle(color: Colors.black,fontSize: 14 ),),

                          const SizedBox(height: 10,),

                          Container(
                            height: 35,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: controller.type.value == 0?btn_select_decoration:btn_not_select_decoration,
                            child: Text(controller.type.value == 0?'正常打开':"无法打开",style: TextStyle(color: Colors.white,fontSize: 12),),
                          ),

                          const SizedBox(height: 10,),

                          const Text('结果截图',style: TextStyle(color: Colors.black,fontSize: 14 ),),

                          const SizedBox(height: 10,),

                          Container(
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
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
                                  return InkWell(
                                    onTap: (){

                                    },
                                    child: Image.asset('assets/images/img_check_upload.png',width: 100,),
                                  );
                                }
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                ],
              ),
            );
          }),
      ),
    );
  }
  
}