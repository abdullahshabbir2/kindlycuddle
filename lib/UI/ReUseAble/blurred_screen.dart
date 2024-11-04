import 'package:flutter/material.dart';


//TODO: Place it in Main ReuseAble folder of App
class BlurredScreen extends StatefulWidget {
  final bool displayBlurredScreen;
  const BlurredScreen({super.key  , required this.displayBlurredScreen});

  @override
  State<BlurredScreen> createState() => _BlurredScreenState();
}

class _BlurredScreenState extends State<BlurredScreen> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.displayBlurredScreen,
      child: Positioned.fill(
        child: Container(
          color: Colors.black.withOpacity(0.5),
        ),
        // child: BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //   child: Container(
        //     color: Colors.black.withOpacity(0.5),
        //   ),
        // ),
      ),
    );
  }
}
