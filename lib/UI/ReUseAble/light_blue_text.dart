import 'package:flutter/cupertino.dart';

Widget lightBlueText(String text,{double? fontSize,FontWeight? fontWeight,double? height}){
  return Text(
    text,
    textAlign: TextAlign.right,
    style: TextStyle(
      color: Color(0xFFB2CBF2),
      fontSize: fontSize ?? 22,
      fontFamily: 'Arial Rounded MT Bold',
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height ?? 0.06,
      letterSpacing: -0.41,
    ),
  );
}