import 'dart:async';
import 'dart:ui' as ui;


import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Constants/image_constants.dart';

class CirclesScreen extends StatefulWidget {
  const CirclesScreen({super.key});

  @override
  State<CirclesScreen> createState() => _CirclesScreenState();
}

class _CirclesScreenState extends State<CirclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: FutureBuilder<ui.Image>(
          future: _loadImage(ImageConstants.pumpIconSmall), // Replace with your asset path
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              return Center(
                child: CustomPaint(
                  size: const Size(200, 200),
                  painter: CirclePainter(image: snapshot.data!, devices: []),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
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