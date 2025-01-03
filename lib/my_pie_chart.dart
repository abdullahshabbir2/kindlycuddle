import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const PichChartPainterScreen());
}

class PichChartPainterScreen extends StatelessWidget {
  const PichChartPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Pie Chart 25 -75'),
        ),
        body: Center(
          child: CustomPaint(
            size: const Size(80, 80), // Size of the canvas
            painter: PieChartPainter(green: 45,lightGreen: 55),
          )
        ),
      ),
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
      ..color = const Color(0xFFABE6ED).withOpacity(0.5)
      ..style = PaintingStyle.fill;

    // Paint for the dark green section (75%, with a slightly larger radius)
    final darkGreenPaint = Paint()
      ..color = const Color(0xFFABE6ED)
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
