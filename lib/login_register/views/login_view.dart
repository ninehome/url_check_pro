import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routers/app_routers.dart';
import '../../common_widgets/sr_image_widget.dart';
import '../../common_widgets/sr_textfield.dart';
import '../../utils/sr_scaffold.dart';
import '../../utils/throttle_utils.dart';
import '../controllers/login_controller.dart';


class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {
  late LoginController logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return SrScaffold.scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => Column(
          children: [
            Stack(
              children: [

                Container(
                  width: 1.sw - 160.w,
                  height: 104.w,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(48.w),
                  ),
                  child: Row(
                    children: [
                      SrImageWidget.pngImage('icon_phone', size: Size(48.w, 48.w),),
                      SizedBox(width: 16.w,),
                      SizedBox(
                        width: 1.sw - 264.w,
                        height: 104.w,
                        child: SrTextFiledWidget(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          height: 116.w,
                          controller: logic.phoneController,
                          backgroundColor: Colors.white,
                          hintText: "请输入手机号",
                          // maxLength: 11,
                          inputType: TextInputType.phone,
                          hintStyle:  TextStyle(fontSize: 32.w, color: const Color(0xff333333), fontWeight: FontWeight.w600, fontFamily: 'PingFang SC',),
                          style:  TextStyle(fontSize: 32.w, color: const Color(0xff666666), fontWeight: FontWeight.w600, fontFamily: 'PingFang SC',),
                          onChanged: (value) {
                            logic.checkLogin();
                          },
                          leftWidget: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {

                            },
                            child: SizedBox(
                              height: 116.w,
                              child: Center(
                                child: Text('+${logic.countryCode.value}', style: TextStyle(fontSize: 32.w, color: const Color(0xff18191d), fontWeight: FontWeight.w500,),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1.sw - 160.w,
                  height: 104.w,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(48.w),
                  ),
                  child: Row(
                    children: [
                      SrImageWidget.pngImage('icon_code', size: Size(48.w, 48.w),),
                      SizedBox(width: 16.w,),
                      SizedBox(
                        width: 1.sw - 264.w,
                        height: 104.w,
                        child: SrTextFiledWidget(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          height: 116.w,
                          controller: logic.codeController,
                          backgroundColor: Colors.white,
                          hintText: "请输入短信验证码",
                          // maxLength: 11,
                          inputType: TextInputType.phone,
                          // hintStyle: SrStyle.w_28_placeholder,
                          // style: SrStyle.w_32_black_semi,
                          onChanged: (value) {
                            logic.checkLogin();
                          },

                        ),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    logic.login();
                  },
                  child: Container(
                    width: 1.sw - 40.w,
                    height: 110.w,
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
          ],
        ),
      ),
    );
  }
}
