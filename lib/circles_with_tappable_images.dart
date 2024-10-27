import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class CirclesWithTappableImages extends StatefulWidget {
//   const CirclesWithTappableImages({super.key});
//
//   @override
//   _CirclesWithTappableImagesState createState() => _CirclesWithTappableImagesState();
// }
//
// class _CirclesWithTappableImagesState extends State<CirclesWithTappableImages> {
//   late ui.Image _image;
//   bool _imageLoaded = false;
//   final List<String> deviceNames = ['Device 1', 'Device 2', 'Device 3']; // Mock device names
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImage(ImageConstants.pumpIconSmall).then((image) {
//       setState(() {
//         _image = image;
//         _imageLoaded = true;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Circles with Tappable Images')),
//       body: Center(
//         child: _imageLoaded
//             ? CustomPaint(
//           size: const Size(400, 400),
//           painter: CirclePainterWithTap(
//             image: _image,
//             devices: deviceNames,
//             onImageTap: (deviceName) {
//               // Handle image tap for a specific device
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Tapped on $deviceName')),
//               );
//             },
//           ),
//         )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
//
//   // Function to load an image from assets
//   Future<ui.Image> _loadImage(String assetPath) async {
//     final ByteData data = await rootBundle.load(assetPath);
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
//       completer.complete(img);
//     });
//     return completer.future;
//   }
// }
//
// class CirclePainterWithTap extends CustomPainter {
//   final ui.Image image;
//   final List<String> devices;
//   final Function(String) onImageTap;
//   final List<Rect> imageRectangles = []; // List to store the image positions
//
//   CirclePainterWithTap({
//     required this.image,
//     required this.devices,
//     required this.onImageTap,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue.withOpacity(0.5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//
//     Offset center = Offset(size.width / 2, size.height / 2);
//
//     List<double> radii = [80, 120, 160];
//     int index = 0;
//
//     for (double radius in radii) {
//       canvas.drawCircle(center, radius, paint);
//
//       double angle = pi / 4;
//       Offset imagePosition = Offset(
//         center.dx + radius * cos(angle),
//         center.dy + radius * sin(angle),
//       );
//
//       _drawImageWithTap(canvas, imagePosition, devices[index]);
//       index++;
//     }
//   }
//
//   void _drawImageWithTap(Canvas canvas, Offset position, String deviceName) {
//     const double imageSize = 40.0; // Image size
//     const double textPadding = 8.0; // Padding between image and text
//
//     // Calculate image destination rectangle
//     Rect imageRect = Rect.fromCenter(
//       center: position,
//       width: imageSize,
//       height: imageSize,
//     );
//     imageRectangles.add(imageRect); // Store image rectangle for gesture detection
//
//     // Draw the image
//     canvas.drawImageRect(
//       image,
//       Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), // Source dimensions
//       imageRect, // Destination
//       Paint(),
//
//     );
//
//     // Draw the text below the image
//     final TextSpan textSpan = TextSpan(
//       text: deviceName,
//       style: const TextStyle(
//         color: Colors.black,
//         fontSize: 10.0,
//       ),
//     );
//
//     final TextPainter textPainter = TextPainter(
//       text: textSpan,
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout(minWidth: 0, maxWidth: imageSize);
//
//     Offset textPosition = Offset(
//       position.dx - textPainter.width / 2,
//       position.dy + imageSize / 2 + textPadding,
//     );
//
//     textPainter.paint(canvas, textPosition);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Always repaint if new images or taps happen
//   }
//
//   // This method helps detect the tapped image based on position
//   String? checkIfTapped(Offset localPosition) {
//
//     debugPrint(localPosition.dx.toString());
//
//     for (int i = 0; i < imageRectangles.length; i++) {
//       if (imageRectangles[i].contains(localPosition)) {
//         return devices[i];
//       }
//     }
//     return null;
//   }
// }
//
// // Gesture detector for handling taps
// class TappableCustomPaint extends StatelessWidget {
//   final CustomPainter painter;
//   final Function(Offset) onTap;
//
//   const TappableCustomPaint({
//     required this.painter,
//     required this.onTap,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapUp: (details) {
//         debugPrint(details.localPosition.dx.toString());
//         final tapPosition = details.localPosition;
//         onTap(tapPosition);
//       },
//       child: CustomPaint(
//         size: const Size(400, 400),
//         painter: painter,
//       ),
//     );
//   }
// }




class CirclesWithTappableImages extends StatefulWidget {
  const CirclesWithTappableImages({super.key});

  @override
  _CirclesWithTappableImagesState createState() => _CirclesWithTappableImagesState();
}

class _CirclesWithTappableImagesState extends State<CirclesWithTappableImages> {
  late ui.Image image;
  int tappedIndex = -1; // To store the index of the tapped image

  @override
  void initState() {
    super.initState();
    _loadImage(ImageConstants.pumpIconSmall).then((img) {
      setState(() {
        image = img;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circles with Tappable Images')),
      body: image == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
            child: GestureDetector(
                    onTapDown: (details) {
            RenderBox box = context.findRenderObject() as RenderBox;
            final offset = box.globalToLocal(details.globalPosition);
            // Check which image was tapped
            final tappedCircleIndex = CirclePainter.detectTappedCircle(offset);
            if (tappedCircleIndex != -2) {
              setState(() {
                tappedIndex = tappedCircleIndex;
                print('Tapped on image ${tappedCircleIndex-1}');
              });
            }
                    },
                    child: CustomPaint(
            size: const Size(300, 300),
            painter: CirclePainter(image: image, tappedIndex: tappedIndex),
                    ),
                  ),
          ),
    );
  }
}

// CustomPainter class for drawing circles and tappable images
class CirclePainter extends CustomPainter {
  final ui.Image image;
  final int tappedIndex;
  static const double imageSize = 40.0; // Size of the image

  CirclePainter({required this.image, required this.tappedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    // Get the center of the canvas
    Offset center = Offset(size.width / 2, size.height / 2);

    // Define the radii of the circles
    List<double> radii = [80, 120, 160];
    int index = 0;

    // Draw circles and place tappable images
    for (double radius in radii) {
      // Draw the circle
      canvas.drawCircle(center, radius, paint);

      // Angle of 45 degrees (π/4 radians) for bottom-right corner
      double angle = pi / 4;

      // Calculate the position for the image on the circumference
      Offset imagePosition = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      // Draw the image and highlight it if tapped
      if (index == tappedIndex) {
        canvas.drawCircle(imagePosition, imageSize / 2, Paint()..color = Colors.red.withOpacity(0.3));
      }
      _drawImage(canvas, imagePosition);

      index++;
    }
  }

  // Helper method to draw the image
  void _drawImage(Canvas canvas, Offset position) {
    // Draw the image at the specified position
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), // Source dimensions
      Rect.fromCenter(center: position, width: imageSize, height: imageSize), // Destination rectangle for the image
      Paint(),
    );
  }

  // Method to detect which circle/image was tapped
  static int detectTappedCircle(Offset tapPosition) {
    List<Offset> imagePositions = [
      Offset(
          150 +
          80 * cos(pi / 4),
          150
              + 80 * sin(pi / 4)), // 1st circle image
      Offset(150 + 120 * cos(pi / 4), 150 + 120 * sin(pi / 4)), // 2nd circle image
      Offset(150 + 160 * cos(pi / 4), 150 + 160 * sin(pi / 4)), // 3rd circle image
    ];

    // Check if the tap is within any image's bounding box
    for (int i = 0; i < imagePositions.length; i++) {
      Rect imageRect = Rect.fromCenter(
          center: imagePositions[i],
          width: imageSize,
          height: imageSize
      );
      if (imageRect.contains(tapPosition)) {
        return i; // Return the index of the tapped image
      }
    }

    return -1; // No image was tapped
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when necessary
  }
}

// Function to load an image from assets
Future<ui.Image> _loadImage(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  final Completer<ui.Image> completer = Completer();
  ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
    completer.complete(img);
  });
  return completer.future;
}
