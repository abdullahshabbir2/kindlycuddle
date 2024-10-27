import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/User%20Guide/ReUseAble/user_guide.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%201/user_guide1_cubit.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%201/user_guide1_initial_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide1Page extends StatefulWidget {
  final UserGuide1Cubit cubit;
  // final UserDeInitialParams initialParams;
  const UserGuide1Page({Key? key, required this.cubit}) : super(key: key);


  @override
  State<UserGuide1Page> createState() => _UserGuide1PageState();
}

class _UserGuide1PageState extends State<UserGuide1Page> {

  UserGuide1Cubit get cubit => widget.cubit;
  ReSizeAbleSize size = ReSizeAbleSize();

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(UserGuide1InitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: UserGuide(heading: 'Modes and Intensities',body: 'Customize the intensity of Baby, Stimulation, and Massage modes to suit your comfort. Save these preferences for consistent, personalized sessions.',onTap: (){
            cubit.moveToUserGuide2();
          },
            img: ImageConstants.UserGuide1,
          ),
        ),
      ),
      designSize: const Size(375.0, 812.0),
    );
  }
}



