import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Bluetooth/Bluetooth%20Permissions/bluetooth_permission_initial_params.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/UI/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bluetooth_permission_cubit.dart';

class BluetoothPermissionPage extends StatefulWidget {
  final BluetoothPermissionCubit cubit;
  // final UserDeInitialParams initialParams;
  const BluetoothPermissionPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<BluetoothPermissionPage> createState() => _BluetoothPermissionPageState();
}

class _BluetoothPermissionPageState extends State<BluetoothPermissionPage> {

  BluetoothPermissionCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(BluetoothPermissionInitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          ReUseAbleSvg(path: ImageConstants.bluetooth),
                          SizedBox(height: 22.h,),
                          headingText('Not Connected'),
                          bodyText('Please turn on Bluetooth to\n connect your pump!'),
                          SizedBox(height: 182.h,),
                          StyledButton(text: 'Turn On', onTap: (){
                            // cubit.moveToNextScreen();

                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>  const Home() )
                            );

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
