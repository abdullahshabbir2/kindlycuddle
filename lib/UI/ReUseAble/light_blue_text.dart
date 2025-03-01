import 'package:flutter/cupertino.dart';

Widget lightBlueText(String text,
    {double? fontSize, FontWeight? fontWeight, double? height, Color? color}) {
  return Text(
    text,
    textAlign: TextAlign.right,
    style: TextStyle(
      color: color,
      fontSize: fontSize ?? 22,
      fontFamily: 'Arial Rounded MT Bold',
      fontWeight: fontWeight ?? FontWeight.bold,
      height: height ?? 0.06,
      letterSpacing: -0.41,
    ),
  );
}
