import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/Stats/ReUseAble/stats_reUseAble.dart';
import 'package:cuddle_care/UI/Stats/stats_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/colors_constants.dart';
import 'stats_initial_params.dart';


class StatsPage extends StatefulWidget {
  final StatsCubit cubit;
  // final UserDeInitialParams initialParams;
  const StatsPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {

  StatsCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(StatsInitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => const SafeArea(
        child: Scaffold(
          body: Column(

          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}

class StatsColumn extends StatefulWidget {
  final StatsCubit cubit;
  const StatsColumn({super.key, required this.cubit});

  @override
  State<StatsColumn> createState() => _StatsColumnState();
}

class _StatsColumnState extends State<StatsColumn> {

  int? touchedIndex;
  ReSizeAbleSize getSize = ReSizeAbleSize();

  Widget top() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingText('Stats',fontSize: 24),
          SizedBox(height: MediaQuery.of(context).size.height*(15/812),),
          lightBlueText( '7-July to 13-July',fontSize: 14,height: 1),

        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height*(14/812),),
      Container(
          width: MediaQuery.of(context).size.width*(140/375),
          height: MediaQuery.of(context).size.height*(40/812),
          padding: const EdgeInsets.fromLTRB(14, 8, 12, 8),
          decoration: ShapeDecoration(
            color:  ColorsConstants.styledButtonBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headingText('Past Week',fontSize: 16.sp,customHeadingHeight: 0.09,color: Colors.black),
              InkWell(
                  onTap: (){

                  },
                  child: const Icon(Icons.keyboard_arrow_down,size: 24,))
            ],
          )
      ),

    ],
  );

  Widget showBarChart() => Container(
    height: MediaQuery.of(context).size.height*(308/812),
    // width: MediaQuery.of(context).size.width*(308/375),
    padding: EdgeInsets.fromLTRB(
      ReSizeAbleSize().getResizeAbleWidth(20,375,context),
      ReSizeAbleSize().getResizeAbleHeight(20,812,context),
      ReSizeAbleSize().getResizeAbleWidth(20,375,context),
      ReSizeAbleSize().getResizeAbleHeight(20,812,context),

    ),

    decoration: ShapeDecoration(
        color:  const Color(0xFFB2CBF2).withOpacity(0.1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        )),
    child: AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(

        BarChartData(
          maxY: 60,
          backgroundColor: Colors.white.withOpacity(0.05999999865889549),
          barGroups: _buildBarGroups(),
          barTouchData: BarTouchData(

            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String weekDay;
                switch (group.x.toInt()) {
                  case 0:
                    weekDay = 'Monday';
                    break;
                  case 1:
                    weekDay = 'Tuesday';
                    break;
                  case 2:
                    weekDay = 'Wednesday';
                    break;
                  case 3:
                    weekDay = 'Thursday';
                    break;
                  case 4:
                    weekDay = 'Friday';
                    break;
                  case 5:
                    weekDay = 'Saturday';
                    break;
                  case 6:
                    weekDay = 'Sunday';
                    break;
                  default:
                    weekDay = '';
                }
                return BarTooltipItem(
                  '$weekDay\nValue: ${rod.toY.round()}',
                  const TextStyle(color: Colors.white),
                );
              },
            ),
            touchCallback: (FlTouchEvent event, response) {
              setState(() {
                if (!event.isInterestedForInteractions || response == null || response.spot == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = response.spot!.touchedBarGroupIndex;
              });
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  return bodyText(value.toInt().toString());
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Disable right Y-axis
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Disable top X-axis
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const daysOfWeek = [
                    'M', 'T', 'W', 'T', 'F', 'S', 'S'
                  ];
                  return bodyText(daysOfWeek[value.toInt()]);
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
            border: const Border(
              left: BorderSide(color: Colors.black, width: 1),
              bottom: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true, // Only show horizontal lines
            horizontalInterval: 10,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.05),
                strokeWidth: 1, // Make it solid by not using dashArray
              );
            },
            drawVerticalLine: false, // Hide vertical lines
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
      MediaQuery.of(context).size.width*(20/375),
      MediaQuery.of(context).size.height*(20/812),
      MediaQuery.of(context).size.width*(20/375),
      MediaQuery.of(context).size.height*(20/812)
      ),
      child: Column(
        children: [
          top(),
          SizedBox(height: MediaQuery.of(context).size.height*(14/812),),
          showBarChart(),
          SizedBox(height: getSize.getResizeAbleHeight(12, 375, context),),
          Container(
            decoration: ShapeDecoration(
                color: ColorsConstants.appPrimary2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)
                )
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                StatsReUseAble(path: ImageConstants.dropBackgorund,mainText: 'Today', data: 33.19,),
                StatsReUseAble(path: ImageConstants.dropBackgorund,mainText: 'Daily Average', data: 40.12,),
                StatsReUseAble(path: ImageConstants.dropBackgorund,mainText: 'Best Day', data: 40.12,fontSize: 11,optionalText: '10-july 2024',),
                StatsReUseAble(path: ImageConstants.dropWhite,mainText: 'Total', data: 280.55,color: const Color(0xFFB2CBF2),textColor: Colors.white,)
              ],
            ),
          ),
        ],
      ),
    );
  }
  List<BarChartGroupData> _buildBarGroups() {

    List<int> data = [25,45,42,56,18,0,0];

    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods:
        [
          BarChartRodData(
            toY: data[index].toDouble(),
            color: index % 2 == 0
                ? ColorsConstants.styledButtonBackgroundColor
                : ColorsConstants.pumpBackground,

            width: 22,
            // borderRadius: BorderRadius.circular(6),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), // Custom rounded top
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5)
            ),

          ),
        ],

      );
    });
  }
}

