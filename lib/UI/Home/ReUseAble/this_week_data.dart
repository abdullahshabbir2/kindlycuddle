import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_time.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/pie_chart_data.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';

class ThisWeekData extends StatelessWidget {
  final int minutes;
  final int second;

  final double? width;
  const ThisWeekData(
      {super.key, required this.minutes, required this.second, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 180),
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(20.0), // Optional: Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReUseAbleSvg(
              path: ImageConstants.clockLight,
              width: 100,
              height: 100,
            ),
            showDataWithTime(context, minutes, second),
            bodyText('This Week',
                bodyFontSize: 16,
                bodyTextColor: Theme.of(context).colorScheme.onSecondaryFixed)
          ],
        ),
      ),
    );
  }
}
