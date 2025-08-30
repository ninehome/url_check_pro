import 'package:flutter/material.dart';

class SrColor {
  static Color whiteColor = Colors.white;
  static Color mainColor = const Color(0xff006cff);
  static Color colorText333333 = const Color(0xff0333333);
  static Color color_000000 = const Color(0xff000000);
  static Color colorHint = const Color(0xffC5C6CC);
  // static Color subTitColor = Colors.black;
  // static Color loginTypeBgColor = const Color(0xFFFDFFFF).withOpacity(0.6);
  // static Color color_000000 = const Color(0xff000000);
  // static Color colorHint = const Color(0xffC5C6CC);
  // static LinearGradient mainLineaBgColor = getGradColor(colors: [const Color(0xff00EDEF),const Color(0xff19EEAC)]);
  // static Color colorTextBlack = const Color(0xff1f2024);
  // static Color colorTextBlackNormal = const Color(0xff2f3036);
  // static Color colorBgWhite = const Color(0xfff5f5f8);
  // static Color colorBgGray = const Color(0xfff5f5f5);
  // static Color colorTextGray1 = const Color(0xff71727a);
  // static Color colorTextGray2 = const Color(0xff8f9098);
  // static Color colorGrayBg = const Color(0xfff4f9ff);
  // static Color colorTextGray3 = const Color(0xffc9cdd7);
  // static Color colorTextBlue = const Color(0xffff3b4f);
  // static Color colorNormalBlue = const Color(0xffff3b4f);
  // static Color colorNormalBlueAlpha1 = const Color(0x193475ff);
  // static Color colorTextRed = const Color(0xffff3b30);
  // static Color colorTextNormalRed = const Color(0xffe70000);
  // static Color colorBackGray1 = const Color(0xfff5f8ff);
  // static Color colorNormalGray = const Color(0xff66ffff);
  // static Color colorBackGray2 = const Color(0xffeff2f5);
  // static Color colorDivider = const Color(0xff000000).withOpacity(0.1);
  // static Color colorPinkBg = const Color(0x14ef446a);
  // static Color colorTextPink = const Color(0xffef446a);
  // static Color colorTextGold = const Color(0xffffd7b2);
  // static Color colorText333333 = const Color(0xff0333333);
  // static Color colorTextcccccc = const Color(0xffcccccc);
  // static Color colorTextff3b4f = const Color(0xffff3b4f);




  /// color linear gradient
  static LinearGradient getGradColor({AlignmentGeometry? begin,AlignmentGeometry? end, List<Color>? colors}) {
    return LinearGradient(
      begin: begin ?? Alignment.centerLeft,
      end: end ?? Alignment.centerRight,
      colors: colors ?? [],
    );
  }
}