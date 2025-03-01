import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_time.dart';
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
  const StatsReUseAble(
      {super.key,
      required this.path,
      required this.mainText,
      this.optionalText,
      required this.data,
      this.fontSize,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(255, 255, 255, 0.38),
          Color.fromRGBO(255, 255, 255, 0)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(1),
        child: ListTile(
          leading: ReUseAbleSvg(
            path: path,
            width: 27,
            height: 27,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bodyText(mainText,
                  bodyFontSize: fontSize ?? 15,
                  bodyTextColor: textColor ??
                      Theme.of(context).colorScheme.onSecondaryFixed),
              bodyText(optionalText ?? '',
                  bodyFontSize: 9,
                  bodyTextColor: textColor ??
                      Theme.of(context).colorScheme.onSecondaryFixed)
            ],
          ),
          trailing: SizedBox(
            width: 115,
            child: showDataWithTime(context, 50, 25,
                headingFontSize: 16, bodyFontSize: 12),
          ),
        ),
      ),
    );
  }
}
