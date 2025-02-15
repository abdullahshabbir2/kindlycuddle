import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final double width;
  final Color color;
  final bool reverse;

  const GradientDivider(
      {Key? key,
      required this.width,
      required this.color,
      this.reverse = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, 2), // Adjust height if needed
      painter: AsymmetricGradientLinePainter(color, reverse),
    );
  }
}

class AsymmetricGradientLinePainter extends CustomPainter {
  final Color color;
  final bool reverse;

  AsymmetricGradientLinePainter(this.color, this.reverse);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: reverse
            ? [
                color.withOpacity(1),
                color.withOpacity(0)
              ] // Right side: Start at 1, fade to 0
            : [
                color.withOpacity(0),
                color.withOpacity(1)
              ], // Left side: Start at 0, increase to 1
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
