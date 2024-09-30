import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';




class MyLineChart extends StatelessWidget {
  const MyLineChart({super.key});




  @override
  Widget build(BuildContext context) {


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



    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.getResizeAbleWidth(325, 375, context),
          height: size.getResizeAbleHeight(115, 812, context),
          child: LineChart(
            LineChartData(
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
                      return Text(value.toInt().toString() + 'oz', style: TextStyle(color: Colors.black,fontSize: 8));
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
                      return Text(daysOfWeek[value.toInt()], style: TextStyle(fontSize: 8),);
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
        ),
      ),
    );
  }
}

