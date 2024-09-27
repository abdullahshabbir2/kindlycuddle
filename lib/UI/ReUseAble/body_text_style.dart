
import 'package:cuddle_care/Constants/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/colors_constants.dart';

TextStyle BodyTextStyle(
    {Color? bodyTextColor, double? bodyFontSize, String? bodyTextFontFamily, FontWeight? bodyTextFontWeight, double? bodyTextHeight, double? bodyTextLetterSpacing
    }){
  return TextStyle(
    color: bodyTextColor ?? ColorsConstants.bodyTextColor,
    fontSize: (bodyFontSize ?? 15),
    fontFamily: bodyTextFontFamily ?? FontFamilyConstants.fontFamilyConstant,
    fontWeight: bodyTextFontWeight ?? FontWeight.w400,
    height: bodyTextHeight ?? 1.2,
    letterSpacing: bodyTextLetterSpacing ?? -0.41,
  );
}