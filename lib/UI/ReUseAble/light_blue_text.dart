import 'package:flutter/cupertino.dart';

Widget lightBlueText(double data,String unit,{double? fontSize,FontWeight? fontWeight,double? height}){
  return Text(
    data.toString() + unit,
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