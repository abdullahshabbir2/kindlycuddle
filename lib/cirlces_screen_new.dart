import 'dart:async';
import 'dart:ui' as ui;
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TappableImageExample extends StatefulWidget {
  const TappableImageExample({super.key});

  @override
  _TappableImageExampleState createState() => _TappableImageExampleState();
}

class _TappableImageExampleState extends State<TappableImageExample> {
  late ui.Image _image;
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadImage(ImageConstants.pumpIconSmall).then((image) {
      setState(() {
        _image = image;
        _imageLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tappable Image Example')),
      body: Center(
        child: _imageLoaded
            ? GestureDetector(
          onTap: () {
            // Handle tap event
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image tapped!')),
            );
          },
          child: CustomPaint(
            size: const Size(200, 200),
            painter: ImagePainter(image: _image),
          ),
        )
            : const CircularProgressIndicator(),
      ),
    );
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
}

// CustomPainter to draw the image
class ImagePainter extends CustomPainter {
  final ui.Image image;

  ImagePainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    const double imageSize = 100.0; // Size of the image

    // Draw the image at the center of the canvas
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), // Source rectangle (from the image)
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2), // Center the image in the canvas
        width: imageSize,
        height: imageSize,
      ),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
