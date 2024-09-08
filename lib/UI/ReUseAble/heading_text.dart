import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/font_family_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text headingText(String text,{TextStyle? textStyle , double? customHeadingFontSize, FontWeight? customHeadingFontWeight , double? customHeadingHeight , double? letterSpacing , String? fontFamily }){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style: textStyle ?? TextStyle(
      color: ColorsConstants.headingTextColor,
      fontSize: customHeadingFontSize ?? 28,
      fontFamily: fontFamily ?? FontFamilyConstants.fontFamilyConstant,
      fontWeight: customHeadingFontWeight ?? FontWeight.w400,
      height: customHeadingHeight ?? 1.0,
      letterSpacing: letterSpacing ?? -0.41,
    ),
  );
}