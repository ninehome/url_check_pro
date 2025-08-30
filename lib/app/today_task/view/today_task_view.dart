import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routers/app_routers.dart';
import '../controller/today_task_controller.dart';
class TodayTaskView extends GetView<TodayTaskController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color:  const Color(0xffffffff),
      ),
      margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.w),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              color:  const Color(0xfff5f5f5),
            ),
            height: 80.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              SizedBox(width: 32.w,),
              Image.asset(
                'assets/images/3543@3x.png',
                width: 20.w,
                height: 20.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 5.w,),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18), // 默认样式
                  children: [
                    TextSpan(
                      text: '今日待检测： ',
                      style: TextStyle(color: Color(0xff999999),fontSize: 24.w),
                    ),
                    TextSpan(
                      text: '999 ',
                      style: TextStyle(color: Color(0xffff7f00),fontSize: 24.w),
                    ),
                  ],
                ),
              ),


              SizedBox(width: 20.w,),
              Image.asset(
                'assets/images/3544@3x.png',
                width: 20.w,
                height: 20.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 5.w,),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18), // 默认样式
                  children: [
                    TextSpan(
                      text: '今日已检测： ',
                      style: TextStyle(color: Color(0xff999999),fontSize: 24.w),
                    ),
                    TextSpan(
                      text: '999 ',
                      style: TextStyle(color: Color(0xff006cff),fontSize: 24.w),
                    ),
                  ],
                ),
              ),

            ],),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.zero,
                itemBuilder: (ctx,index){
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15,right: 15),
                    height: 60,
                    child: Stack(
                      children: [

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(
                              child: Column(
                                children: [
                                  Text('https://www.iconfont.cn/search/index?searchType=icon&g=%E7%AD%89%E5%BE%85&page=1&fromCollection=-1',
                                    style: (index ==0||index ==1) ? TextStyle(color: Color(0xffff7f00),fontSize: 12):TextStyle(color: Color(0xff006cff),fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRouter.checkResult);
                              },
                              child: Container(
                                width: 70,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:(index ==0||index ==1) ?Color(0xffff7f00): Color(0xff006cff),

                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text('检测完成',style: TextStyle(color: Color(0xffffffff) ,fontSize: 12),),
                              ),
                            ),

                          ],
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 0.1,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

}