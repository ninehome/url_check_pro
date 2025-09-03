
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ValueBtnWidget extends StatelessWidget{

  var btnName ;
  var enable ;
  Function () onTap ;

  BoxDecoration enableDecoration = BoxDecoration(
    color: Color(0xff006cff),
    borderRadius: BorderRadius.circular(10),
  );

  BoxDecoration notEnableDecoration = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10),
  );


  ValueBtnWidget({super.key,required this.btnName,required this.enable ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.center,
        decoration: enable?enableDecoration:notEnableDecoration,
        child: Text(btnName,style: TextStyle(color: Colors.white,fontSize: 15),),
      ),
    );
  }


}