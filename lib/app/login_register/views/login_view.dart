import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common_widgets/sr_textfield.dart';
import '../../../utils/sr_scaffold.dart';
import '../controllers/login_controller.dart';


class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {
  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return SrScaffold.scaffold(
      backgroundColor: Color(0xff006cff),
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => Column(
          children: [
            Container(
              width: double.infinity,
              height: 104.w,
              margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 200.h,bottom: 80.h),
              child: Text("${controller.title.value}",style: TextStyle(color: Colors.white,fontSize: 50.w,fontWeight: FontWeight.w600),),
            ),
            Container(
              width: double.infinity,
              height: 104.w,
              margin: EdgeInsets.only(left: 20.w, right: 20.w,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20.w,),
                  Image.asset(
                    'assets/images/icon_phone.png',
                    width: 40.w,
                    height: 40.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 16.w,),
                  SizedBox(
                    width: 1.sw - 264.w,
                    height: 104.w,
                    child: SrTextFiledWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      height: 116.w,
                      controller: controller.phoneController,
                      backgroundColor: Colors.white,
                      hintText: "请输入账号",
                      // maxLength: 11,
                      inputType: TextInputType.text,
                      hintStyle:  TextStyle(fontSize: 32.w, color: const Color(0xff999999), fontWeight: FontWeight.w500, fontFamily: 'PingFang SC',),
                      style:  TextStyle(fontSize: 32.w, color: const Color(0xff333333), fontWeight: FontWeight.w500, fontFamily: 'PingFang SC',),
                      onChanged: (value) {

                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 104.w,
              margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 50.h,bottom: 100.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20.w,),
                  Image.asset(
                    'assets/images/icon_password.png',
                    width: 40.w,
                    height: 40.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 16.w,),
                  SizedBox(
                    width: 1.sw - 264.w,
                    height: 104.w,
                    child: SrTextFiledWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      height: 116.w,
                      controller: controller.codeController,
                      backgroundColor: Colors.white,
                      hintText: "请输入短信验证码",
                      // maxLength: 11,
                      inputType: TextInputType.text,
                      onChanged: (value) {

                      },

                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controller.login();
              },
              child: Container(
                width: double.infinity,
                height: 110.w,
                margin: EdgeInsets.only(left: 20.w,right: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color:  const Color(0xffffffff),
                ),
                child: Center(
                  child: Text('确定', style:  TextStyle(
                    fontSize: 32.w,
                    color: const Color(0xff006cff),
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
