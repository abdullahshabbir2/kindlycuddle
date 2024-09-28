// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(MaterialApp(home: BarChartExample()));
// // }
// //
// // class BarChartExample extends StatefulWidget {
// //   @override
// //   _BarChartExampleState createState() => _BarChartExampleState();
// // }
// //
// // class _BarChartExampleState extends State<BarChartExample> {
// //   int? touchedIndex;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Bar Chart Example')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             AspectRatio(
// //               aspectRatio: 1.5,
// //               child: BarChart(
// //                 BarChartData(
// //                   barGroups: _buildBarGroups(),
// //                   barTouchData: BarTouchData(
// //                     touchTooltipData: BarTouchTooltipData(
// //                       // tooltipBgColor: Colors.blueAccent,
// //                       getTooltipItem: (group, groupIndex, rod, rodIndex) {
// //                         String weekDay;
// //                         switch (group.x.toInt()) {
// //                           case 0:
// //                             weekDay = 'Monday';
// //                             break;
// //                           case 1:
// //                             weekDay = 'Tuesday';
// //                             break;
// //                           case 2:
// //                             weekDay = 'Wednesday';
// //                             break;
// //                           case 3:
// //                             weekDay = 'Thursday';
// //                             break;
// //                           case 4:
// //                             weekDay = 'Friday';
// //                             break;
// //                           case 5:
// //                             weekDay = 'Saturday';
// //                             break;
// //                           case 6:
// //                             weekDay = 'Sunday';
// //                             break;
// //                           default:
// //                             weekDay = '';
// //                         }
// //                         return BarTooltipItem(
// //                           '$weekDay\nValue: ${rod.toY.round()}',
// //                           TextStyle(color: Colors.white),
// //                         );
// //                       },
// //                     ),
// //                     touchCallback: (FlTouchEvent event, response) {
// //                       setState(() {
// //                         if (!event.isInterestedForInteractions || response == null || response.spot == null) {
// //                           touchedIndex = -1;
// //                           return;
// //                         }
// //                         touchedIndex = response.spot!.touchedBarGroupIndex;
// //                       });
// //                     },
// //                   ),
// //                   titlesData: FlTitlesData(
// //                     leftTitles: AxisTitles(
// //                       sideTitles: SideTitles(showTitles: true, interval: 10),
// //                     ),
// //                     bottomTitles: AxisTitles(
// //                       sideTitles: SideTitles(
// //                         showTitles: true,
// //                         getTitlesWidget: (value, meta) {
// //                           const daysOfWeek = [
// //                             'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
// //                           ];
// //                           return Text(daysOfWeek[value.toInt()]);
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                   borderData: FlBorderData(show: false),
// //                   gridData: FlGridData(show: true),
// //                 ),
// //               ),
// //             ),
// //             if (touchedIndex != null && touchedIndex! >= 0)
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Text(
// //                   'Selected day: ${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'][touchedIndex!]}',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   List<BarChartGroupData> _buildBarGroups() {
// //     return List.generate(7, (index) {
// //       return BarChartGroupData(
// //         x: index,
// //         barRods: [
// //           BarChartRodData(
// //             toY: (index + 1) * 10.0,
// //             color: index == touchedIndex ? Colors.orange : Colors.blue,
// //             width: 22,
// //             borderRadius: BorderRadius.circular(6),
// //           ),
// //         ],
// //       );
// //     });
// //   }
// // }
//
//
//
//
// import 'package:cuddle_care/Constants/colors_constants.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(home: BarChartExample()));
// }
//
// class BarChartExample extends StatefulWidget {
//   @override
//   _BarChartExampleState createState() => _BarChartExampleState();
// }
//
// class _BarChartExampleState extends State<BarChartExample> {
//   int? touchedIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Bar Chart Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             AspectRatio(
//               aspectRatio: 1.5,
//               child: BarChart(
//                 BarChartData(
//                   barGroups: _buildBarGroups(),
//                   barTouchData: BarTouchData(
//                     touchTooltipData: BarTouchTooltipData(
//                       // tooltipBgColor: Colors.blueAccent,
//                       getTooltipItem: (group, groupIndex, rod, rodIndex) {
//                         String weekDay;
//                         switch (group.x.toInt()) {
//                           case 0:
//                             weekDay = 'Monday';
//                             break;
//                           case 1:
//                             weekDay = 'Tuesday';
//                             break;
//                           case 2:
//                             weekDay = 'Wednesday';
//                             break;
//                           case 3:
//                             weekDay = 'Thursday';
//                             break;
//                           case 4:
//                             weekDay = 'Friday';
//                             break;
//                           case 5:
//                             weekDay = 'Saturday';
//                             break;
//                           case 6:
//                             weekDay = 'Sunday';
//                             break;
//                           default:
//                             weekDay = '';
//                         }
//                         return BarTooltipItem(
//                           '$weekDay\nValue: ${rod.toY.round()}',
//                           TextStyle(color: Colors.white),
//                         );
//                       },
//                     ),
//                     touchCallback: (FlTouchEvent event, response) {
//                       setState(() {
//                         if (!event.isInterestedForInteractions || response == null || response.spot == null) {
//                           touchedIndex = -1;
//                           return;
//                         }
//                         touchedIndex = response.spot!.touchedBarGroupIndex;
//                       });
//                     },
//                   ),
//                   titlesData: FlTitlesData(
//                     show: true,
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         interval: 10,
//                         getTitlesWidget: (value, meta) {
//                           return Text(value.toInt().toString());
//                         },
//                       ),
//                     ),
//                     rightTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false), // Disable right Y-axis
//                     ),
//                     topTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false), // Disable top X-axis
//                     ),
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         getTitlesWidget: (value, meta) {
//                           const daysOfWeek = [
//                             'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
//                           ];
//                           return Text(daysOfWeek[value.toInt()]);
//                         },
//                       ),
//                     ),
//                   ),
//                   borderData: FlBorderData(
//                     show: true,
//                     border: Border(
//                       left: BorderSide(color: Colors.black, width: 1),
//                       bottom: BorderSide(color: Colors.black, width: 1),
//                     ),
//                   ),
//                   gridData: FlGridData(show: true),
//                 ),
//               ),
//             ),
//             if (touchedIndex != null && touchedIndex! >= 0)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Selected day: ${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'][touchedIndex!]}',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<BarChartGroupData> _buildBarGroups() {
//     return List.generate(7, (index) {
//       return BarChartGroupData(
//         x: index,
//         barRods: [
//           BarChartRodData(
//             toY: (index + 1) * 10.0,
//             color: index%2 == 0 ? ColorsConstants.styledButtonBackgroundColor : ColorsConstants.styledButtonBackgroundColor.withOpacity(0.5),
//             width: 22,
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ],
//       );
//     });
//   }
// }


import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BarChartExample()));
}

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bar Chart Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*(308/812),
              // width: MediaQuery.of(context).size.width*(308/375),
              padding: EdgeInsets.all(8),

              decoration: ShapeDecoration(
                  color:  Color(0xFFB2CBF2).withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )),
              child: Center(
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
                              TextStyle(color: Colors.white),
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
                        border: Border(
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
              ),
            ),
            if (touchedIndex != null && touchedIndex! >= 0)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Selected day: ${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'][touchedIndex!]}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
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
            borderRadius: BorderRadius.only(
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
