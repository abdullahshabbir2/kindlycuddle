import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(PichChartPainterScreen());
}

class PichChartPainterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Pie Chart 25 -75'),
        ),
        body: CustomPaint(
          size: Size(MediaQuery.of(context).size.width*(80/375), MediaQuery.of(context).size.width*(80/812)), // Size of the canvas
          painter: PieChartPainter(green: 45,lightGreen: 55),
        ),
      ),
    );
  }
}


class PieChartData extends StatelessWidget {
  final double lightColor;
  final double mainColor;
  const PieChartData({super.key, required this.lightColor, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(80, 80), // Size of the canvas
      painter: PieChartPainter(green: mainColor,lightGreen: lightColor),
    );
  }
}

class PieChartPainter extends CustomPainter {
  double green;
  double lightGreen;
  PieChartPainter({
    required this.green,
    required this.lightGreen
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    final rectLarger = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 1.1, // Slightly larger size for the dark green section
      height: size.height * 1.1,
    );

    // Paint for the light green section (25%)
    final lightGreenPaint = Paint()
      ..color = Color(0xFFABE6ED).withOpacity(0.5)
      ..style = PaintingStyle.fill;

    // Paint for the dark green section (75%, with a slightly larger radius)
    final darkGreenPaint = Paint()
      ..color = Color(0xFFABE6ED)
      ..style = PaintingStyle.fill;

    // Drawing the light green section (25% of the pie)
    final lightGreenSweepAngle = 2 * pi * (lightGreen/100); // 25% of the circle (90 degrees)
    canvas.drawArc(rect, 0, lightGreenSweepAngle, true, lightGreenPaint);

    // Drawing the dark green section (remaining 75%, slightly larger radius)
    final darkGreenSweepAngle = 2 * pi * (green / 100); // 75% of the circle (270 degrees)
    canvas.drawArc(rectLarger, lightGreenSweepAngle, darkGreenSweepAngle, true, darkGreenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
