import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';




class DialogUtils {
  /// 构造函数里面初始化EasyLoading
  static initLoading({
    TransitionBuilder? builder,
  }) {
    _configLoading();
    if (builder != null) {
      return EasyLoading.init(builder: builder);
    } else {
      return EasyLoading.init();
    }
  }

  /// 配置Loading默认参数
  static void _configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  /// 网络请求加载框
  static netWorkLoading({String? msg}) async {
    await EasyLoading.show(
        status: msg ?? '加载中...', maskType: EasyLoadingMaskType.clear);
  }

  /// 移除Loading框
  static dismiss() {
    EasyLoading.dismiss();
  }

  /// 吐司提示
  static showToast(String? msg, {int? duration}) async {

    if(msg ==null || msg ==""){
      return ;
    }
    await EasyLoading.showToast("$msg",
        duration: duration != null
            ? Duration(milliseconds: duration)
            : const Duration(milliseconds: 2000),
        maskType: EasyLoadingMaskType.clear);
  }

  /// 显示成功加载框
  static succcessLoading({String? msg, int? duration}) async {
    await EasyLoading.showSuccess(msg ?? '加载成功!',
        duration: duration != null
            ? Duration(milliseconds: duration)
            : const Duration(milliseconds: 2000),
        maskType: EasyLoadingMaskType.clear);
  }

  /// 显示错误加载框
  static failedLoading({String? msg, int? duration}) async {
    await EasyLoading.showError(msg ?? '加载失败!',
        duration: duration != null
            ? Duration(milliseconds: duration)
            : const Duration(milliseconds: 2000),
        maskType: EasyLoadingMaskType.clear);
  }

  /// 信息提示加载框
  static showInfoLoading(String? msg, {int? duration}) async {
    await EasyLoading.showInfo(msg!,
        duration: duration != null
            ? Duration(milliseconds: duration)
            : const Duration(milliseconds: 2000),
        maskType: EasyLoadingMaskType.clear);
  }

  /// 进度加载框
  static showProgressLoading(double progress) {
    if (progress <= 1.0 && progress >= 0) {
      EasyLoading.showProgress(progress,
          status: '${(progress * 100).toStringAsFixed(0)}%',
          maskType: EasyLoadingMaskType.black);
    } else {
      EasyLoading.dismiss();
    }
  }


}
