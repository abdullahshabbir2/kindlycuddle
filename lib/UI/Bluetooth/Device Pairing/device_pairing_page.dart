import 'dart:ui';

import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_initial_params.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Searching Devices/circles.dart';
import 'device_pairing_cubit.dart';

class DevicePairingPage extends StatefulWidget {
  final DevicePairingCubit cubit;
  // final UserDeInitialParams initialParams;
  const DevicePairingPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<DevicePairingPage> createState() => _DevicePairingPageState();
}

class _DevicePairingPageState extends State<DevicePairingPage> {

  DevicePairingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(DevicePairingInitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 43.5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AssetsImages(path: ImageConstants.kindlyCuddle,height: 50),

                  ],
                ),
                SizedBox(height: 30.h,),

                Stack(
                  children: [
                    ReUseAbleSvg(path: ImageConstants.backgroundShape),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 193.h,),
                          // ReUseAbleSvg(path: ImageConstants.bluetooth),
                          SizedBox(height: 22.h,),

                          Stack(
                            alignment: Alignment.center, // Ensures everything is centered
                            children: [
                              // CustomPaint with defined size
                              CustomPaint(
                                size: Size(300, 300), // Define the size for both circles and the SVG
                                painter: CirclePainter(
                                  // image: Image(image: AssetImage(''),),
                                ),
                              ),
                              // Center the SVG within the same sized container
                              ReUseAbleSvg(path: ImageConstants.bluetooth), // Ensure this widget is centered
                            ],
                          ),
                          SizedBox(height: 50.h,),

                        ],
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust the blur strength here
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 196.h,),
                          Center(child: ReUseAbleSvg(path: ImageConstants.pumpLightBlue, height: 90.h,width: 90.w,)),
                          bodyText('Pump 203',bodyFontSize: 21),
                          SizedBox(height: 254.h,),
                          StyledButton(text: 'Start Pairing', onTap: (){
                            
                          })
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}
