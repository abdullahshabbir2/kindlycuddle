import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/Stats/ReUseAble/stats_reUseAble.dart';
import 'package:cuddle_care/UI/Stats/stats_cubit.dart';
import 'package:cuddle_care/theme/theme_notifier.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => const SafeArea(
        child: Scaffold(
          body: Column(),
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
              headingText('Stats',
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSecondaryFixed),
              SizedBox(
                height: MediaQuery.of(context).size.height * (15 / 812),
              ),
              lightBlueText('7-July to 13-July',
                  fontSize: 14,
                  height: 1,
                  color: Theme.of(context).colorScheme.onPrimaryFixed),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (14 / 812),
          ),
          Container(
              width: MediaQuery.of(context).size.width * (140 / 375),
              height: MediaQuery.of(context).size.height * (40 / 812),
              padding: const EdgeInsets.fromLTRB(14, 8, 12, 8),
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headingText('Past Week',
                      fontSize: 16.sp,
                      customHeadingHeight: 0.09,
                      color: Theme.of(context).colorScheme.primary),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                      ))
                ],
              )),
        ],
      );

  Widget showBarChart(bool? isDark) => Container(
        height: MediaQuery.of(context).size.height * (308 / 812),
        padding: EdgeInsets.fromLTRB(
          ReSizeAbleSize().getResizeAbleWidth(20, 375, context),
          ReSizeAbleSize().getResizeAbleHeight(20, 812, context),
          ReSizeAbleSize().getResizeAbleWidth(20, 375, context),
          ReSizeAbleSize().getResizeAbleHeight(20, 812, context),
        ),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: isDark == true
                ? const [
                    Color.fromRGBO(
                        255, 255, 255, 0.23), // Violet with same opacity
                    Color.fromRGBO(
                        196, 133, 255, 0.231), // Grey with same opacity
                  ]
                : const [
                    Color.fromRGBO(255, 255, 255, 0.23), // Original white
                    Color.fromRGBO(178, 203, 242, 0.37), // Original blue
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: BarChart(
            BarChartData(
              maxY: 60,
              backgroundColor: Colors.white.withOpacity(0.05999999865889549),
              barGroups: _buildBarGroups(isDark),
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
                    if (!event.isInterestedForInteractions ||
                        response == null ||
                        response.spot == null) {
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
                      return bodyText(value.toInt().toString(),
                          bodyTextColor:
                              Theme.of(context).colorScheme.onSecondaryFixed);
                    },
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles:
                      SideTitles(showTitles: false), // Disable right Y-axis
                ),
                topTitles: const AxisTitles(
                  sideTitles:
                      SideTitles(showTitles: false), // Disable top X-axis
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const daysOfWeek = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                      return bodyText(daysOfWeek[value.toInt()],
                          bodyTextColor:
                              Theme.of(context).colorScheme.onSecondaryFixed);
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
                    color: Colors.grey.withOpacity(0.1),
                    strokeWidth: 2, // Make it solid by not using dashArray
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
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    final String imagePath = themeNotifier.isDarkMode
        ? ImageConstants.dropBackgorundDark
        : ImageConstants.dropBackgorund;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * (20 / 375),
          MediaQuery.of(context).size.height * (20 / 812),
          MediaQuery.of(context).size.width * (20 / 375),
          MediaQuery.of(context).size.height * (20 / 812)),
      child: Column(
        children: [
          top(),
          SizedBox(
            height: MediaQuery.of(context).size.height * (14 / 812),
          ),
          showBarChart(themeNotifier.isDarkMode),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatsReUseAble(
                    path: imagePath,
                    mainText: 'Today',
                    data: 33.19,
                  ),
                  StatsReUseAble(
                    path: imagePath,
                    mainText: 'Daily Average',
                    data: 40.12,
                  ),
                  StatsReUseAble(
                    path: imagePath,
                    mainText: 'Best Day',
                    data: 40.12,
                    fontSize: 11,
                    optionalText: '10-july 2024',
                  ),
                  StatsReUseAble(
                    path: ImageConstants.dropWhite,
                    mainText: 'Total',
                    data: 280.55,
                    color: themeNotifier.isDarkMode
                        ? const Color.fromRGBO(131, 99, 225, 1)
                        : const Color.fromRGBO(178, 203, 242, 1),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(bool? isDark) {
    List<int> data = [25, 45, 42, 56, 18, 0, 0];

    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: data[index].toDouble(),
            color: isDark == true
                ? (index % 2 == 0
                    ? const Color.fromRGBO(
                        131, 99, 225, 1) // Dark violet for even bars
                    : const Color.fromRGBO(
                        172, 143, 255, 1)) // Dark indigo for odd bars
                : (index % 2 == 0
                    ? ColorsConstants
                        .styledButtonBackgroundColor // Light theme even color
                    : ColorsConstants.pumpBackground), // Light theme odd color

            width: 22,
            // borderRadius: BorderRadius.circular(6),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), // Custom rounded top
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5)),
          ),
        ],
      );
    });
  }
}
