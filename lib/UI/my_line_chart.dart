import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class MyLineChart extends StatelessWidget {
  const MyLineChart({super.key});




  @override
  Widget build(BuildContext context) {


    List<FlSpot> _buildLineSpots() {
      return [
        FlSpot(0, 10), // Monday
        FlSpot(1, 40), // Tuesday
        FlSpot(2, 30), // Wednesday
        FlSpot(3, 60), // Thursday
        FlSpot(4, 50), // Friday
        FlSpot(5, 70), // Saturday
        FlSpot(6, 100), // Sunday
      ];
    }



    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: LineChart(
            LineChartData(
              maxY: 100, // Maximum value for Y-axis
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
                      return Text(value.toInt().toString(), style: TextStyle(color: Colors.black));
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
                      const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                      return Text(daysOfWeek[value.toInt()]);
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
                  color: Colors.blueAccent, // Color of the line
                  barWidth: 4, // Line width
                  dotData: FlDotData(
                    // show: true, // Show dots at each data point
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
                  // tooltipBgColor: Colors.blueGrey.withOpacity(0.8),

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


class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart({
    required this.seriesList,
    required this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  // factory SimpleLineChart.withSampleData() {
  //   return new SimpleLineChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  var series = _createSampleData();


  @override
  Widget build(BuildContext context) {
    return charts.LineChart(series, animate: animate,defaultRenderer: charts.LineRendererConfig(
      includePoints: true,   // Optional: include points on the line
      // radiusPx: 4.0,         // Size of points
      // includeArea: false,    // Optional: fill the area under the line
      strokeWidthPx: 3.0,    // Thickness of the curved line
      // curved: true,          // This makes the line curved!
    ),);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, num>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}