import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';

class StatsReUseAble extends StatelessWidget {
  final String mainText;
  final String? optionalText;
  final double data;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  final String path;
  const StatsReUseAble({super.key, required this.path ,required this.mainText  , this.optionalText, required this.data, this.fontSize, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.transparent,
      child: ListTile(
        leading: ReUseAbleSvg(path: path,width: 27,height: 27,),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bodyText(mainText,bodyFontSize: fontSize ?? 15, bodyTextColor: textColor),
            bodyText(optionalText ?? '',bodyFontSize: 9,bodyTextColor: textColor)
          ],
        ),
        trailing: headingText('$data oz' ,
            fontSize: 15,color: textColor),
      ),
    );
  }
}
