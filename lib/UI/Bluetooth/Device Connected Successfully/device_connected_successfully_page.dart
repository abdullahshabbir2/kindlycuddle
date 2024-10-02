import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Connected%20Successfully/device_connected_successfully_initial_params.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'device_connected_successfully_cubit.dart';

class DeviceConnectedSuccessfullyPage extends StatefulWidget {
  final DeviceConnectedSuccessfullyCubit cubit;
  // final UserDeInitialParams initialParams;
  const DeviceConnectedSuccessfullyPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<DeviceConnectedSuccessfullyPage> createState() => _DeviceConnectedSuccessfullyPageState();
}

class _DeviceConnectedSuccessfullyPageState extends State<DeviceConnectedSuccessfullyPage> {

  DeviceConnectedSuccessfullyCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(DeviceConnectedSuccessfullyInitialParams());
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
                    ReUseAbleSvg(path: ImageConstants.rectangleGreen),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 193.h,),
                          ReUseAbleSvg(path: ImageConstants.bluetoothGreen),
                          SizedBox(height: 22.h,),
                          headingText('Connected'),
                          bodyText('Pump 203 has been connected\n successfully '),
                          SizedBox(height: 182.h,),
                          StyledButton(
                            backgroundColor: ColorsConstants.backgroundColor,
                              text: 'Turn Off', onTap: (){
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
      designSize: const Size(375.0, 812.0),
    );
  }
}