// import 'dart:math';
// import 'dart:ui' as ui;
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class Circles extends StatelessWidget {
//   const Circles({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder(
//
//     );
//   }
// }
//
// // class CirclePainter extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     // Define the paint style for the circles
// //     Paint paint = Paint()
// //       ..color = Colors.blue.withOpacity(0.5)
// //       ..style = PaintingStyle.stroke
// //       ..strokeWidth = 3.0;
// //
// //     // Get the center of the canvas
// //     Offset center = Offset(size.width / 2, size.height / 2);
// //
// //     // Draw circles with different radii but the same center
// //     // canvas.drawCircle(center, 40, paint);
// //     canvas.drawCircle(center, 80, paint);
// //     canvas.drawCircle(center, 120, paint);
// //     canvas.drawCircle(center, 160, paint);
// //   }
// //
// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     return false;
// //   }
// // }
//
//
// // CustomPainter class for drawing circles and an image on the circle
// class CirclePainter extends CustomPainter {
//   ui.Image? image; // Holds the image that will be drawn
//
//   CirclePainter({this.image});
//
//   @override
//   void paint(Canvas canvas, Size size) {
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
//
//     // Draw the image on the edge of the largest circle if the image is loaded
//     if (image != null) {
//       // Calculate the position of the image on the circumference of the largest circle
//       double radius = 160;
//       Offset imagePosition = Offset(
//         center.dx + radius * cos(0), // Adjust the angle if needed
//         center.dy + radius * sin(0),
//       );
//
//       // Paint the image, scaling it to fit (e.g., 50x50 size)
//       canvas.drawImageRect(
//         image!,
//         Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble()), // Source image dimensions
//         Rect.fromCenter(center: imagePosition, width: 50, height: 50), // Destination rectangle on canvas
//         Paint(),
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Repaint if needed (e.g., if image changes)
//   }
// }
//
// // Function to load an image from assets
// Future<ui.Image> loadImage(BuildContext context, String path) async {
//   final imageData = await DefaultAssetBundle.of(context).load(path);
//   final codec = await ui.instantiateImageCodec(imageData.buffer.asUint8List());
//   final frame = await codec.getNextFrame();
//   return frame.image;
// }



// import 'dart:math';
// import 'dart:ui' as ui;
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class Circles extends StatelessWidget {
//   const Circles({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Circles with Icons')),
//       body: Center(
//         child: CustomPaint(
//           size: const Size(400, 400),
//           painter: CirclePainter(),
//         ),
//       ),
//     );
//   }
// }
//
// // CustomPainter class for drawing circles and an image on the bottom right of each circle
// class CirclePainter extends CustomPainter {
//   ui.Image? image; // Holds the image that will be drawn
//
//   CirclePainter({this.image});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue.withOpacity(0.5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//
//     // Get the center of the canvas
//     Offset center = Offset(size.width / 2, size.height / 2);
//
//     // Define the radii of the circles
//     List<double> radii = [80, 120, 160];
//
//     // Draw circles and place image icons at the bottom right of each circle
//     for (double radius in radii) {
//       // Draw the circle
//       canvas.drawCircle(center, radius, paint);
//
//       // If the image is loaded, calculate its position at the bottom right of the circle
//       if (image != null) {
//         // Angle of 45 degrees (π/4 radians) for bottom-right corner
//         double angle = pi / 4;
//
//         // Calculate the position for the image on the circumference
//         Offset imagePosition = Offset(
//           center.dx + radius * cos(angle),
//           center.dy + radius * sin(angle),
//         );
//
//         // Draw the image at the calculated position
//         canvas.drawImageRect(
//           image!,
//           Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble()), // Source image dimensions
//           Rect.fromCenter(center: imagePosition, width: 40, height: 40), // Destination rectangle for the image
//           Paint(),
//         );
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Repaint if needed (e.g., if image changes)
//   }
// }
//
// // Function to load an image from assets
// Future<ui.Image> loadImage(BuildContext context, String path) async {
//   final imageData = await DefaultAssetBundle.of(context).load(path);
//   final codec = await ui.instantiateImageCodec(imageData.buffer.asUint8List());
//   final frame = await codec.getNextFrame();
//   return frame.image;
// }



// import 'dart:math';
// import 'package:flutter/material.dart';
//
// class Circles extends StatelessWidget {
//   const Circles({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Circles with Icons')),
//       body: Center(
//         child: CustomPaint(
//           size: const Size(400, 400),
//           painter: CirclePainter(),
//         ),
//       ),
//     );
//   }
// }
//
// // CustomPainter class for drawing circles and an icon at the bottom right of each circle
// class CirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue.withOpacity(0.5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//
//     // Get the center of the canvas
//     Offset center = Offset(size.width / 2, size.height / 2);
//
//     // Define the radii of the circles
//     List<double> radii = [80, 120, 160];
//
//     // Draw circles and place icons at the bottom right of each circle
//     for (double radius in radii) {
//       // Draw the circle
//       canvas.drawCircle(center, radius, paint);
//
//       // Angle of 45 degrees (π/4 radians) for bottom-right corner
//       double angle = pi / 4;
//
//       // Calculate the position for the icon on the circumference
//       Offset iconPosition = Offset(
//         center.dx + radius * cos(angle),
//         center.dy + radius * sin(angle),
//       );
//
//       // Draw the icon at the calculated position
//       _drawIcon(canvas, iconPosition);
//     }
//   }
//
//   // Helper method to draw the Icons.person icon
//   void _drawIcon(Canvas canvas, Offset position) {
//     const icon = Icons.person; // Choose the icon
//     const textStyle = TextStyle(
//       fontSize: 40, // Size of the icon
//       fontFamily: 'MaterialIcons', // Family for Material Icons
//       color: Colors.black, // Icon color
//     );
//
//     // Create a TextSpan with the icon
//     final textSpan = TextSpan(text: String.fromCharCode(icon.codePoint), style: textStyle);
//
//     // Use TextPainter to paint the icon at the desired position
//     final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
//     textPainter.layout(); // Layout the text (icon)
//     textPainter.paint(canvas, position - Offset(textPainter.width / 2, textPainter.height / 2));
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false; // No need to repaint unless properties change
//   }
// }


// import 'dart:async';
// import 'dart:math';
// import 'dart:ui' as ui;
// import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class CirclePainter extends CustomPainter {
//   final ui.Image image;
//   final List<BluetoothDeviceInfo> devices;
//   CirclePainter({required this.image, required this.devices});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue.withOpacity(0.5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//
//     // Get the center of the canvas
//     Offset center = Offset(size.width / 2, size.height / 2);
//
//
//     // Define the radii of the circles
//     List<double> radii = [80, 120, 160];
//     // List<String> names = ;
//     int index = 0;
//     // Draw circles and place images at the bottom right of each circle
//     for (double radius in radii) {
//       // Draw the circle
//       canvas.drawCircle(center, radius, paint);
//
//       // Angle of 45 degrees (π/4 radians) for bottom-right corner
//       double angle = pi / 4;
//
//       // Calculate the position for the image on the circumference
//       Offset imagePosition = Offset(
//         center.dx + radius * cos(angle),
//         center.dy + radius * sin(angle),
//       );
//
//       // Draw the image at the calculated position
//       _drawImage(canvas, imagePosition, devices[index] );
//       index++;
//     }
//   }
//
//   // Helper method to draw the image and text below it
//   void _drawImage(Canvas canvas, Offset position, BluetoothDeviceInfo  label) {
//     const double imageSize = 40.0; // Size of the image
//     String labelText = label.name; // Text to display below the image
//     const double textPadding = 8.0; // Padding between image and text
//
//     // Draw the image at the specified position
//     canvas.drawImageRect(
//       image,
//       Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), // Source dimensions
//       Rect.fromCenter(center: position, width: imageSize, height: imageSize), // Destination rectangle for the image
//       Paint(),
//     );
//
//     // Create the TextSpan and TextPainter to draw text below the image
//     final TextSpan textSpan = TextSpan(
//       text: labelText,
//       style: const TextStyle(
//         color: Colors.black, // Text color
//         fontSize: 10.0, // Text size
//       ),
//     );
//
//     final TextPainter textPainter = TextPainter(
//       text: textSpan,
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//
//     // Layout the text to measure its width and height
//     textPainter.layout(minWidth: 0, maxWidth: imageSize);
//
//     // Calculate the position for the text (below the image)
//     Offset textPosition = Offset(
//       position.dx - textPainter.width / 2, // Center the text horizontally under the image
//       position.dy + imageSize / 2 //+ textPadding, // Place the text just below the image
//     );
//
//     // Draw the text at the calculated position
//     textPainter.paint(canvas, textPosition);
//   }
//
//
//   // Helper method to draw the image
//   // void _drawImage(Canvas canvas, Offset position) {
//   //   const double imageSize = 40.0; // Size of the image
//   //
//   //   // Draw the image at the specified position
//   //   canvas.drawImageRect(
//   //     image,
//   //     Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), // Source dimensions
//   //     Rect.fromCenter(center: position, width: imageSize, height: imageSize), // Destination rectangle for the image
//   //     Paint(),
//   //   );
//   // }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false; // No need to repaint unless properties change
//   }
// }
//
// // Function to load an image from assets
// Future<ui.Image> _loadImage(String assetPath) async {
//   final ByteData data = await rootBundle.load(assetPath);
//   final Completer<ui.Image> completer = Completer();
//   ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
//     completer.complete(img);
//   });
//   return completer.future;
// }


// import 'dart:async';
// import 'dart:math';
// import 'dart:ui' as ui;
// import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class Circles extends StatefulWidget {
//   const Circles({super.key});
//
//   @override
//   _CirclesState createState() => _CirclesState();
// }
//
// class _CirclesState extends State<Circles> {
//   late ui.Image _image;
//   bool _imageLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImage().then((image) {
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
//       appBar: AppBar(title: const Text('Circles with Image')),
//       body: _imageLoaded
//           ? Stack(
//         children: [
//           CustomPaint(
//             size: const Size(300, 300),
//             painter: CirclePainter(
//               image: _image,
//               devices: [
//                 BluetoothDeviceInfo(name: "Device 1",id: '11',rssi: '123'),
//                 BluetoothDeviceInfo(name: "Device 2",id: '11',rssi: '123'),
//                 BluetoothDeviceInfo(name: "Device 3",id: '11',rssi: '123'),
//               ],
//             ),
//           ),
//           // Overlay GestureDetector widgets over each image
//           Positioned.fill(
//             child: GestureDetectorOverlay(
//               painter: CirclePainter(
//                 image: _image,
//                 devices: [
//                   BluetoothDeviceInfo(name: "Device 1", id: '11',rssi: '123'),
//                   BluetoothDeviceInfo(name: "Device 2",id: '11',rssi: '123'),
//                   BluetoothDeviceInfo(name: "Device 3",id: '11',rssi: '123'),
//                 ],
//               ),
//               onTap: (index) {
//                 debugPrint(index.toString());
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Tapped on Device ${index + 1}')),
//                 );
//               },
//             ),
//           ),
//         ],
//       )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
//
//   Future<ui.Image> _loadImage() async {
//     final ByteData data = await rootBundle.load('assets/your_image.png'); // Replace with your asset path
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
//       completer.complete(img);
//     });
//     return completer.future;
//   }
// }
//
// // CustomPainter class for drawing circles and an image at the bottom right of each circle
// class CirclePainter extends CustomPainter {
//   final ui.Image image;
//   final List<BluetoothDeviceInfo> devices;
//   final List<Offset> imagePositions = [];
//
//   CirclePainter({required this.image, required this.devices});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue.withOpacity(0.5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;
//
//     // Get the center of the canvas
//     Offset center = Offset(size.width / 2, size.height / 2);
//
//     // Define the radii of the circles
//     List<double> radii = [80, 120, 160];
//     int index = 0;
//
//     // Draw circles and place images at the bottom right of each circle
//     for (double radius in radii) {
//       // Draw the circle
//       canvas.drawCircle(center, radius, paint);
//
//       // Angle of 45 degrees (π/4 radians) for bottom-right corner
//       double angle = pi / 4;
//
//       // Calculate the position for the image on the circumference
//       Offset imagePosition = Offset(
//         center.dx + radius * cos(angle),
//         center.dy + radius * sin(angle),
//       );
//
//       // Store the image position for later use
//       imagePositions.add(imagePosition);
//
//       // Draw the image and text below it
//       _drawImage(canvas, imagePosition, devices[index].name);
//       index++;
//     }
//   }
//
//   // Helper method to draw the image and text below it
//   void _drawImage(Canvas canvas, Offset position, String label) {
//     const double imageSize = 40.0; // Size of the image
//     const double textPadding = 8.0; // Padding between image and text
//
//     // Draw the image at the specified position
//     canvas.drawImageRect(
//       image,
//       Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), // Source dimensions
//       Rect.fromCenter(center: position, width: imageSize, height: imageSize), // Destination rectangle for the image
//       Paint(),
//     );
//
//     // Create the TextSpan and TextPainter to draw text below the image
//     final TextSpan textSpan = TextSpan(
//       text: label,
//       style: const TextStyle(
//         color: Colors.black, // Text color
//         fontSize: 10.0, // Text size
//       ),
//     );
//
//     final TextPainter textPainter = TextPainter(
//       text: textSpan,
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//
//     // Layout the text to measure its width and height
//     textPainter.layout(minWidth: 0, maxWidth: imageSize);
//
//     // Calculate the position for the text (below the image)
//     Offset textPosition = Offset(
//       position.dx - textPainter.width / 2, // Center the text horizontally under the image
//       position.dy + imageSize / 2 + textPadding, // Place the text just below the image
//     );
//
//     // Draw the text at the calculated position
//     textPainter.paint(canvas, textPosition);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Repaint on any changes
//   }
// }
//
// // GestureDetector Overlay class for handling taps on images
// class GestureDetectorOverlay extends StatelessWidget {
//   final CirclePainter painter;
//   final Function(int) onTap;
//
//   GestureDetectorOverlay({required this.painter, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: List.generate(painter.imagePositions.length, (index) {
//         Offset imagePosition = painter.imagePositions[index];
//         return Positioned(
//           left: imagePosition.dx - 20, // Adjust based on image size (half of image width)
//           top: imagePosition.dy - 20, // Adjust based on image size (half of image height)
//           child: GestureDetector(
//             onTap: () => onTap(index), // Call onTap with index of the image tapped
//             child: SizedBox(
//               width: 100, // Image width
//               height: 100, // Image height
//               child: Container(color: Colors.transparent), // Transparent clickable area
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }


import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// // Mock class for BluetoothDeviceInfo
// class BluetoothDeviceInfo {
//   final String name;
//   BluetoothDeviceInfo({required this.name});
// }

class Circles extends StatefulWidget {
  const Circles({super.key});

  @override
  _CirclesState createState() => _CirclesState();
}

class _CirclesState extends State<Circles> {
  late ui.Image _image;
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadImage().then((image) {
      setState(() {
        _image = image;
        _imageLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circles with Image')),
      body: _imageLoaded
          ? Stack(
        children: [
          // Custom painter for circles
          CustomPaint(
            size: const Size(300, 300),
            painter: CirclePainter(
              image: _image,
              devices: [
                BluetoothDeviceInfo(name: "Device 1", id: '',rssi: ''),
                BluetoothDeviceInfo(name: "Device 2",id: '',rssi: ''),
                BluetoothDeviceInfo(name: "Device 3",id: '',rssi: ''),
              ],
            ),
          ),
          // Overlay GestureDetectors
          ..._buildGestureDetectors(),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  // Build GestureDetector widgets overlayed at image positions
  List<Widget> _buildGestureDetectors() {
    List<Offset> positions = [
      const Offset(240, 160), // Example position for image 1 (Adjust as needed)
      const Offset(200, 200), // Example position for image 2 (Adjust as needed)
      const Offset(160, 240), // Example position for image 3 (Adjust as needed)
    ];

    return List.generate(positions.length, (index) {
      return Positioned(
        left: positions[index].dx - 20, // Adjust to center the GestureDetector
        top: positions[index].dy - 20,  // Adjust to center the GestureDetector
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on Device ${index + 1}')),
            );
          },
          child: Container(
            width: 40,  // Match the size of the image
            height: 40, // Match the size of the image
            color: Colors.transparent, // Make it transparent but tappable
          ),
        ),
      );
    });
  }

  // Load image from assets
  Future<ui.Image> _loadImage() async {
    final ByteData data = await rootBundle.load('assets/your_image.png'); // Replace with your asset path
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      completer.complete(img);
    });
    return completer.future;
  }
}

// CustomPainter class for drawing circles and images
class CirclePainter extends CustomPainter {
  final ui.Image image;
  final List<BluetoothDeviceInfo> devices;

  CirclePainter({required this.image, required this.devices});

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

    // Draw circles and place images
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

      // Draw the image and text below it
      _drawImage(canvas, imagePosition, devices[index].name ?? '');
      index++;
    }
  }

  // Helper method to draw the image and text
  void _drawImage(Canvas canvas, Offset position, String label) {
    const double imageSize = 40.0;
    const double textPadding = 8.0;

    // Draw the image at the specified position
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromCenter(center: position, width: imageSize, height: imageSize),
      Paint(),
    );

    // Draw the text below the image
    final TextSpan textSpan = TextSpan(
      text: label,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 10.0,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: imageSize);

    // Calculate the position for the text
    Offset textPosition = Offset(
      position.dx - textPainter.width / 2,
      position.dy + imageSize / 2 + textPadding,
    );

    textPainter.paint(canvas, textPosition);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint if anything changes
  }
}

