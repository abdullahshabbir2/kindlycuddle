import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_unit.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/pie_chart_data.dart';
import 'package:flutter/material.dart';

class ThisWeekData extends StatelessWidget {
  final double percentage;
  final double? width;
  const ThisWeekData({super.key, required this.percentage, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height*(178/812),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PieChartData(lightColor: percentage, mainColor: 100-percentage),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height*(12/812),
          // ),
          showDataWithUnit(percentage, 'oz'),
          bodyText('This Week',bodyFontSize: 16)
        ],
      ),
    );
  }
}
