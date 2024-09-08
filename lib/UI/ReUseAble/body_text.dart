import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/font_family_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bodyText(String text,{TextStyle? textStyle, Color? bodyTextColor , double? bodyFontSize , FontWeight? bodyTextFontWeight , double? bodyTextHeight , double? bodyTextLetterSpacing, String? bodyTextFontFamily}){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style: textStyle ?? TextStyle(
      color: bodyTextColor ?? ColorsConstants.bodyTextColor,
      fontSize: bodyFontSize ?? 15.sp,
      fontFamily: bodyTextFontFamily ?? FontFamilyConstants.fontFamilyConstant,
      fontWeight: bodyTextFontWeight ?? FontWeight.w400,
      height: bodyTextHeight ?? 1.2,
      letterSpacing: bodyTextLetterSpacing ?? -0.41,
    ),
  );
}