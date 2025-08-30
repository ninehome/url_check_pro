import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class SrTheme {
  ThemeData getTheme() {
    return ThemeData(
      // brightness: Brightness.dark,
      // 取消按钮的溅射效果
      dividerColor: Colors.transparent,   // 去掉上下黑色分隔线
      splashColor: Colors.transparent,    // 去掉点击时的水波纹
      highlightColor: Colors.transparent, // 去掉点击高亮背景
      hoverColor: Colors.transparent,
      // 页面背景色
      scaffoldBackgroundColor: Colors.white,

      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),

      // appBarTheme: AppBarTheme(
      //   backgroundColor: Colors.transparent, // 背景透明
      //   elevation: 0, // 去掉阴影
      //   toolbarHeight: 0, // 将高度设置为 0
      // ),
      // 全局appbar样式控制
      // appBarTheme: AppBarTheme(
      //   elevation: 0.0,
      //   //分割线
      //   color: Colors.white,
      //   scrolledUnderElevation: 0, //滑动式 避免tabBar自带的背景颜色
      //   //背景色
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness:
      //     Platform.isAndroid ? Brightness.dark : Brightness.dark,
      //     statusBarBrightness:
      //     Platform.isAndroid ? Brightness.dark : Brightness.dark,
      //   ),
      // ),
      // 底部 bottom 主题
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //浮动按钮样式 after v1.13.2. 后不建议使用
        backgroundColor: Colors.blue,
      ),
    );
  }
}