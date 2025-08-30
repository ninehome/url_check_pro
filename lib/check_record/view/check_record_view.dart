import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routers/app_routers.dart';
import '../controller/check_record_controller.dart';
class CheckRecordView extends GetView<CheckRecordController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color:  const Color(0xffffffff),
      ),
      margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.w),
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
                            style: TextStyle(color: Color(0xff006cff),fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 4,),

                          Text('检测时间：2025-08-19 15:25:30',
                            style: TextStyle(color: Colors.grey,fontSize: 12),
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
                        border: BoxBorder.all(
                          color: Color(0xff006cff),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text('查看结果',style: TextStyle(color: Color(0xff006cff) ,fontSize: 12),),
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
    );
  }

}