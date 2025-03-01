import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ReUseAble/body_text.dart';
import '../../ReUseAble/heading_text.dart';

Widget showDataWithTime(
  BuildContext context,
  int minutes,
  int seconds, {
  double? headingFontSize,
  double? bodyFontSize,
  FontWeight? bodyFontWeight,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      headingText(minutes.toString(),
          fontSize: headingFontSize ?? 24,
          color: Theme.of(context).colorScheme.primary
          // Dynamic color
          ),
      bodyText("min  ",
          bodyFontSize: bodyFontSize ?? 12,
          bodyTextFontWeight: bodyFontWeight ?? FontWeight.w400,
          bodyTextHeight: 1,
          bodyTextColor: Theme.of(context).colorScheme.onSecondaryFixed),
      headingText(seconds.toString(),
          fontSize: headingFontSize ?? 24,
          color: Theme.of(context).colorScheme.primary
          // Dynamic color
          ),
      bodyText("sec",
          bodyFontSize: bodyFontSize ?? 12,
          bodyTextFontWeight: bodyFontWeight ?? FontWeight.w400,
          bodyTextHeight: 1,
          bodyTextColor: Theme.of(context).colorScheme.onSecondaryFixed),
    ],
  );
}
