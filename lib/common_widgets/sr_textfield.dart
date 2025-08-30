import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/sr_color.dart';


class SrTextFiledWidget extends StatefulWidget {
  final EdgeInsets? padding; //输入框左右边距
  final double? height;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextInputType? inputType;
  final TextInputAction? textInputAction; //右下角确认按钮
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool? enabled;
  final bool readOnly;
  final Function? onChanged;
  final Function? onSubmitted;
  final BoxDecoration? decoration;
  final Color? backgroundColor;
  final Widget? rightWidget;
  final Widget? leftWidget;
  final double? cursorHeight; //光标大小
  final FocusNode? focusNode;
  final bool? obscureText; // 隐私密码
  final int? maxLines;

  final TextAlign textAlign ;

  const SrTextFiledWidget({
    super.key,
    this.padding,
    this.hintText = "请输入",
    this.style,
    this.inputType,
    required this.controller,
    this.inputFormatter,
    this.maxLength,
    this.enabled,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.rightWidget,
    this.decoration,
    this.backgroundColor,
    this.leftWidget,
    this.height,
    this.cursorHeight,
    this.hintStyle,
    this.focusNode,
    this.textInputAction,
    this.obscureText,
    this.maxLines,
    this.textAlign = TextAlign.start
  });

  @override
  State<SrTextFiledWidget> createState() => _DzTextFiledWidgetState();
}

class _DzTextFiledWidgetState extends State<SrTextFiledWidget> {
  List<TextInputFormatter> inputFormatter = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.inputFormatter != null && widget.inputFormatter!.isNotEmpty) {
      inputFormatter.addAll(widget.inputFormatter!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height ?? 100.w,
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 30.w),
        alignment: Alignment.centerLeft,
        decoration: widget.decoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.backgroundColor ?? Colors.white),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.leftWidget ?? Container(),
              widget.leftWidget != null
                  ? SizedBox(
                      width: 20.w,
                    )
                  : Container(),
              Expanded(
                  child: TextField(
                focusNode: widget.focusNode,
                // cursorHeight: widget.cursorHeight,
                cursorColor: SrColor.colorText333333,
                // textAlign: TextAlign.left,
                controller: widget.controller,
                maxLines: 1,
                textAlign: widget.textAlign,
                enabled: widget.enabled,
                maxLength: widget.maxLength,
                readOnly: widget.readOnly,
                keyboardType: widget.inputType,
                inputFormatters: inputFormatter,
                style: widget.style ??
                    TextStyle(fontSize: 32.w, color: const Color(0xff333333), fontWeight: FontWeight.w500, fontFamily: 'PingFang SC',),

                      textInputAction: widget.textInputAction,
                obscureText: widget.obscureText ?? false,
                obscuringCharacter: '*',
                //输入文本的样式
                decoration: InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle ??
                         TextStyle(fontSize: 32.w, color: const Color(0xff999999), fontWeight: FontWeight.w500, fontFamily: 'PingFang SC',),
                    counterText: '',
                    isDense: true,
                    contentPadding: EdgeInsets.all(5.w)),
                onChanged: (v) {
                  widget.onChanged?.call(v);
                },
                onSubmitted: (v) {
                  widget.onSubmitted?.call(v);
                },
              )),
              widget.rightWidget != null
                  ? SizedBox(
                      width: 20.w,
                    )
                  : Container(),
              widget.rightWidget ?? Container(),
            ]));
  }
}
