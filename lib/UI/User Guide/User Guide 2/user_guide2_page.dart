import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/User%20Guide/ReUseAble/user_guide.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_cubit.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_initial_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide2Page extends StatefulWidget {
  final UserGuide2Cubit cubit;
  // final UserDeInitialParams initialParams;
  const UserGuide2Page({Key? key, required this.cubit}) : super(key: key);


  @override
  State<UserGuide2Page> createState() => _UserGuide2PageState();
}

class _UserGuide2PageState extends State<UserGuide2Page> {

  UserGuide2Cubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(UserGuide2InitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: UserGuide(heading: 'Control Panel', body: 'Manage each pump\'s function, battery level, and session duration easily. Adjust suction levels, set timers, and track milk volume for efficient pumping.',onTap: (){
            cubit.moveToUserGuide3();
          },
              img: ImageConstants.UserGuide2
          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}
