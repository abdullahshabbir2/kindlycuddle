import 'package:cuddle_care/UI/ReUseAble/body_text_style.dart';
import 'package:flutter/cupertino.dart';
Widget bodyText(String text,{TextStyle? textStyle, Color? bodyTextColor , double? bodyFontSize , FontWeight? bodyTextFontWeight , double? bodyTextHeight , double? bodyTextLetterSpacing, String? bodyTextFontFamily ,}){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style: textStyle ?? BodyTextStyle(bodyTextColor: bodyTextColor,bodyFontSize: bodyFontSize,bodyTextFontFamily: bodyTextFontFamily,bodyTextFontWeight: bodyTextFontWeight,bodyTextHeight: bodyTextHeight,bodyTextLetterSpacing: bodyTextLetterSpacing)
  );
}