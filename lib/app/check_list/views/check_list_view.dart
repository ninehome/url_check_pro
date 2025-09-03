import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/sr_scaffold.dart';
import '../../check_record/view/check_record_view.dart';
import '../../today_task/view/today_task_view.dart';
import '../controllers/check_list_controller.dart';


class CheckListView extends StatefulWidget {
  CheckListView({super.key});

  @override
  State<CheckListView> createState() => _LoginPageState();
}

class _LoginPageState extends State<CheckListView> {
  late CheckListController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CheckListController());
  }

  @override
  Widget build(BuildContext context) {
    return SrScaffold.scaffold(
      backgroundColor: Color(0xff006cff),
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => Column(
          children: [

            SizedBox(height: 100.w,),
            Row(
              children: [
                SizedBox(width: 32.w,),
                Image.asset(
                  '${controller.topLeftLogo.value}',
                  width: 219.w,
                  height: 50.w,
                  fit: BoxFit.contain,
                ),

                Spacer(),

                Container(
                  width: 65.w,
                  height: 65.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.w),
                    image: DecorationImage(
                      image: AssetImage('assets/images/user_logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


                SizedBox(width: 10.w,),
                Text("蛇墩墩点",style: TextStyle(color: Colors.white,fontSize: 32.w),),
                SizedBox(width: 32.w,),
              ],
            ),
            SizedBox(height: 40.w,),
            Container(
                height: 90.w,
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller.scrollController,     // 绑定 ScrollController
                    // 设置为横向滚动
                    itemCount: controller.dataList.length,
                    physics: const BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          controller.itemOnClick(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: controller.dataList[index]['choice'] ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.w),
                              color:  const Color(0xffffffff),
                            ),
                            child: Container(
                              width: 320.w,
                              decoration: BoxDecoration(
                                color: controller.dataList[index]['choice'] ? const Color(0xffffffff) : const Color(0xffeeeeee),
                                borderRadius: BorderRadius.circular(100.w),
                              ),
                              child: Center(
                               child:  Text(controller.dataList[index]["title"],
                                   style: TextStyle(
                                       color: Color(0xff006cff),
                                       fontWeight: FontWeight.w600,
                                       fontSize: 28.w)),
                              ),
                            ),
                          ):
                          Container(
                            width: 320.w,
                            decoration: BoxDecoration(
                              color: controller.dataList[index]['choice'] ? const Color(0xffffffff) : Color(
                                  0x11021125),
                              borderRadius: BorderRadius.circular(100.w),

                            ),
                            child:  Center(
                              child:Text(controller.dataList[index]["title"],
                                  style: TextStyle(
                                      color: Color(0xffeeeeee),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28.w)),
                            ),
                          ),
                        ),
                      );
                    })),

            SizedBox(height: 30.w,),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(), // 禁止滑动
                controller: controller.tabController,
                children:   [
                  TodayTaskView(),
                  CheckRecordView()
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
