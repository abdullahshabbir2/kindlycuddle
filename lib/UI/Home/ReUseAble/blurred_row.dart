import 'dart:ui';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_unit.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlurredRow extends StatelessWidget {
  final String title;
  final double value;
  final String unit;
  final String date;

  const BlurredRow({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bodyText(
                  title,
                  bodyFontSize: 16,
                  bodyTextColor: Theme.of(context).colorScheme.onSecondaryFixed,
                  bodyTextFontWeight: FontWeight.w400,
                ),
                showDataWithUnit(context, value, unit),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReUseAbleSvg(
                  path: themeNotifier.isDarkMode
                      ? ImageConstants.dropDark
                      : ImageConstants.drop),
              bodyText(date,
                  bodyFontSize: 14,
                  bodyTextFontWeight: FontWeight.w400,
                  bodyTextColor:
                      Theme.of(context).colorScheme.onSecondaryFixed),
            ],
          ),
        ],
      ),
    );
  }
}
