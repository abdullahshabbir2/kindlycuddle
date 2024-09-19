import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/circles.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_cubit.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../ReUseAble/heading_text.dart';
import '../../ReUseAble/styled_button.dart';

class SearchingDevicesPage extends StatefulWidget {
  final SearchingDevicesCubit cubit;
  // final UserDeInitialParams initialParams;
  const SearchingDevicesPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<SearchingDevicesPage> createState() => _SearchingDevicesPageState();
}

class _SearchingDevicesPageState extends State<SearchingDevicesPage> {

  SearchingDevicesCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(SearchingDevicesInitialParams());
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
                          StyledButton(text: 'Turn Off', onTap: (){
                            cubit.moveToNextScreen();
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
