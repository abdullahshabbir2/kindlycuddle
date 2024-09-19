import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class Circles extends StatelessWidget {
  const Circles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(

    );
  }
}

// class CirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Define the paint style for the circles
//     Paint paint = Paint()
//       ..color = Colors.blue.withOpacity(0.5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//
//     // Get the center of the canvas
//     Offset center = Offset(size.width / 2, size.height / 2);
//
//     // Draw circles with different radii but the same center
//     // canvas.drawCircle(center, 40, paint);
//     canvas.drawCircle(center, 80, paint);
//     canvas.drawCircle(center, 120, paint);
//     canvas.drawCircle(center, 160, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }


// CustomPainter class for drawing circles and an image on the circle
class CirclePainter extends CustomPainter {
  ui.Image? image; // Holds the image that will be drawn

  CirclePainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    // Get the center of the canvas
    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw circles with different radii but the same center
    // canvas.drawCircle(center, 40, paint);
    canvas.drawCircle(center, 80, paint);
    canvas.drawCircle(center, 120, paint);
    canvas.drawCircle(center, 160, paint);

    // Draw the image on the edge of the largest circle if the image is loaded
    if (image != null) {
      // Calculate the position of the image on the circumference of the largest circle
      double radius = 160;
      Offset imagePosition = Offset(
        center.dx + radius * cos(0), // Adjust the angle if needed
        center.dy + radius * sin(0),
      );

      // Paint the image, scaling it to fit (e.g., 50x50 size)
      canvas.drawImageRect(
        image!,
        Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble()), // Source image dimensions
        Rect.fromCenter(center: imagePosition, width: 50, height: 50), // Destination rectangle on canvas
        Paint(),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint if needed (e.g., if image changes)
  }
}

// Function to load an image from assets
Future<ui.Image> loadImage(BuildContext context, String path) async {
  final imageData = await DefaultAssetBundle.of(context).load(path);
  final codec = await ui.instantiateImageCodec(imageData.buffer.asUint8List());
  final frame = await codec.getNextFrame();
  return frame.image;
}
