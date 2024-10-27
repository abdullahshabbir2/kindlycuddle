import 'package:flutter/cupertino.dart';

import '../../ReUseAble/body_text.dart';
import '../../ReUseAble/heading_text.dart';

Widget showDataWithUnit(double data,String unit , {double? headingFontSize, double? bodyFontSize,FontWeight? bodyFontWeight }){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      headingText(data.toString(),fontSize: headingFontSize ?? 28,color: const Color(0xFF222222)),
      bodyText(unit,bodyFontSize:bodyFontSize ?? 14,bodyTextFontWeight: bodyFontWeight ?? FontWeight.w400,bodyTextHeight: 1),
    ],
  );
}