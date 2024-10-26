import 'dart:async';

import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/Service/ble/ble_controller.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/UI/Session%20Options/ReUseAble/play_pause_option.dart';
import 'package:cuddle_care/UI/Session%20Start/ReUseAble/volume_data.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_cubit.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_state.dart';
import 'package:cuddle_care/UI/timer_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:googleapis/admob/v1.dart';

class SessionStartPage extends StatefulWidget {
  final SessionStartCubit cubit;
  // final UserDeInitialParams initialParams;
  final int seconds;
  const SessionStartPage({Key? key, required this.cubit, required this.seconds}) : super(key: key);


  @override
  State<SessionStartPage> createState() => _SessionStartPageState();
}

class _SessionStartPageState extends State<SessionStartPage> {

  SessionStartCubit get cubit => widget.cubit;
  final BleController bleController = Get.put(BleController());

  ReSizeAbleSize size = ReSizeAbleSize();
  List<FlSpot> _buildLineSpots() {
    return [
      FlSpot(0, 5), // Monday
      FlSpot(1, 20), // Tuesday
      FlSpot(2, 15), // Wednesday
      FlSpot(3, 30), // Thursday
      FlSpot(4, 0), // Friday
      FlSpot(5, 0), // Saturday
      FlSpot(6, 0), // Sunday
    ];
  }


  Widget top() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment:   CrossAxisAlignment.start,
        children: [
          headingText('Session',customHeadingHeight: 1),
          lightBlueText('Pump 203 Connected',fontSize: 14,height: 1)
        ],
      ),
      ReUseAbleSvg(path: ImageConstants.startOptions)
    ],
  );

  Widget bottomContainer() => Container(
    width: size.getResizeAbleWidth(335, 375, context),
    height: size.getResizeAbleHeight(235, 812, context),
    // clipBehavior: Clip.antiAlias,
    padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width*(12/375),
        MediaQuery.of(context).size.height*(12/812),
        MediaQuery.of(context).size.width*(12/375),
        MediaQuery.of(context).size.height*(12/812),

    ),
    decoration: ShapeDecoration(
      color: ColorsConstants.appPrimary2.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyText('Volume',bodyFontSize: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(width: size.getResizeAbleWidth(12, 375, context),),
            VolumeData(orientation: 'Left', data: 25.40,isColorWhite: true,),
            SizedBox(width: size.getResizeAbleWidth(9, 375, context),),
            VolumeData(orientation: 'Right', data: 30.02,isColorWhite: true,),
            SizedBox(width: size.getResizeAbleWidth(9, 375, context),),
            VolumeData(orientation: 'Total', data: 55.42,isColorWhite: false,),
            //
            // SizedBox(width: size.getResizeAbleWidth(12, 375, context),),

          ],
        ),
        SizedBox(height: size.getResizeAbleHeight(5, 812, context),),
        Container(
          width: size.getResizeAbleWidth(309, 375, context),
          height: size.getResizeAbleHeight(115, 812, context),

          padding: EdgeInsets.fromLTRB(
              size.getResizeAbleWidth(10, 375, context),
              size.getResizeAbleHeight(10, 812, context),
              size.getResizeAbleWidth(10, 375, context),
              size.getResizeAbleHeight(10, 812, context)
          ),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: LineChart(
            LineChartData(
              backgroundColor: Colors.white,
              maxY: 50, // Maximum value for Y-axis
              minY: 0, // Minimum value for Y-axis
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                horizontalInterval: 10, // Interval for Y-axis grid
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.2), // Barely visible horizontal grid lines
                    strokeWidth: 0.5,
                  );
                },
                drawVerticalLine: false, // No vertical grid lines
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 10, // Show labels with an interval on Y-axis
                    getTitlesWidget: (value, meta) {
                      return bodyText(value.toInt().toString() + 'oz' , bodyFontSize: 8);
                      // Text(value.toInt().toString() + 'oz', style: TextStyle(color: Colors.black,fontSize: 8));
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Disable right Y-axis
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Disable top X-axis
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const daysOfWeek = ['0m', '5m', '10m', '15m', '20m', '25m', '30m'];
                      return bodyText(daysOfWeek[value.toInt()],bodyFontSize: 8);
                      // Text(daysOfWeek[value.toInt()], style: TextStyle(fontSize: 8),);
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: false, // Disable axis lines
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: _buildLineSpots(), // Points for the line chart
                  isCurved: true, // Smooth curve
                  color: ColorsConstants.appPrimary2, // Color of the line
                  barWidth: 2, // Line width
                  dotData: FlDotData(
                    show: false, // Show dots at each data point
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 6, // Dot size
                        color: Colors.redAccent, // Dot color
                        strokeWidth: 2,
                        strokeColor: Colors.black, // Dot border color
                      );
                    },
                  ),
                  // belowBarData: BarAreaData(
                  //   show: true, // Fill area under the line
                  //   color: Colors.blueAccent.withOpacity(0.1),
                  //
                  //   // gradientFrom: Offset(0, 0),
                  //   // gradientTo: Offset(0, 1),
                  // ),
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      String weekDay;
                      switch (spot.x.toInt()) {
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
                      return LineTooltipItem(
                        '$weekDay\nValue: ${spot.y.toStringAsFixed(1)}',
                        TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                ),
                handleBuiltInTouches: true,
              ),
            ),
          ),
        )

      ],
    ),
  );

  Timer? _timer;
  int _elapsedTicks = 0; // Track how many intervals have passed
  // final int _maxTicks = ;

  TimerController timerController = TimerController();

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _elapsedTicks = 0; // Reset ticks for a fresh start if needed
  }

  void performFunctionality(int ticks) {
    debugPrint(ticks.toString());
    cubit.setTimePassed(ticks);
    cubit.setTimeRemaining(widget.seconds - ticks);
    print("Functionality performed at: ${DateTime.now()}");
  }

  void pauseTimer() {
    _timer?.cancel();
    _timer = null; // Set to null so it can be resumed later
  }

  void resumeTimer(int _maxTicks) {
    if (_timer == null && _elapsedTicks < _maxTicks) {
      startTimer(_maxTicks); // Restart the timer if it’s not running and time remains
    }
  }

  void startTimer(int _maxTicks) {
    _timer ??= Timer.periodic(Duration(seconds: 1), (timer) {
      _elapsedTicks++;
      performFunctionality(_elapsedTicks);

      if (_elapsedTicks >= _maxTicks) {
        stopTimer(); // Stop the timer after 1 minute
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(SessionStartInitialParams());
   cubit.navigator.context =  context;



    cubit.setTotalTime(widget.seconds);

    startTimer(60);

    // int timr = timerController.startTimer();
    //
    // debugPrint(timr.toString());
    //
    // int num = timerController.getElapsedTicks();
    //
    // debugPrint(num.toString());

   //  Timer(Duration(minutes: 1), () {
   //
   //
   //
   // });

   // Number of 5-second intervals to reach 1 minute









  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: PopScope(
          onPopInvoked: (onPopInvoked){
            Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);

          },
          child:
          Scaffold(
            // appBar: AppBar(
            //   automaticallyImplyLeading: false,
            // ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  top(),
                  SizedBox(height: size.getResizeAbleHeight(14, 375, context),),
                  Container(
                    width: size.getResizeAbleWidth(335, 375, context),
                    height: size.getResizeAbleHeight(242, 812, context),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Colors.white.withOpacity(0.6100000143051147), ColorsConstants.appPrimary2],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: BlocBuilder(
                        bloc: cubit,
                        builder: (context , state) {
                          state as SessionStartState;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PLayPauseOption(
                                time: '${state.minutesPassed}:${state.secondsPassed}', image: ImageConstants.playButton, align: 'Pause',onTap: (){
                                // timerController.pauseTimer();
                                pauseTimer();
                                bleController.controlPause(1);  },),
                              PLayPauseOption(
                                time: '${state.minutesLeft}:${state.secondsLeft}',
                                image: ImageConstants.pauseButton,
                                align: 'Play',
                                onTap: (){
                                // timerController.resumeTimer();
                                stopTimer();
                                resumeTimer(widget.seconds);
                                bleController.controlPause(0);

                                },
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                  SizedBox(height: size.getResizeAbleHeight(16, 375, context),),
                  //
                  bodyText('Total Time'),
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context , state) {
                       state as SessionStartState;
                      return headingText(
                          '${state.minutesTotal}:${state.secondsTotal}:00',
                          fontSize: 40
                      );
                    }
                  ),
                  SizedBox(height: size.getResizeAbleHeight(24, 812, context),),
                  bottomContainer(),
                  StyledButton(text: 'Stop Session', onTap: (){
                    stopTimer();
                    bleController.controlOnOff(0);
                    // cubit.moveToUserGuide1();
                    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);

                  }, textColor: Colors.white,backgroundColor: ColorsConstants.stopSessionColor,height: size.getResizeAbleHeight(61, 812, context),)
                ],
              ),
            ),
          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}


