import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/User%20Guide/ReUseAble/user_guide.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_cubit.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_initial_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide4Page extends StatefulWidget {
  final UserGuide4Cubit cubit;
  // final UserDeInitialParams initialParams;
  const UserGuide4Page({Key? key, required this.cubit}) : super(key: key);


  @override
  State<UserGuide4Page> createState() => _UserGuide4PageState();
}

class _UserGuide4PageState extends State<UserGuide4Page> {

  UserGuide4Cubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(UserGuide4InitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: UserGuide(heading: 'Breast and Nipple Care', body: 'Protect your skin with our disposable or reusable nipple pads. Proper care reduces discomfort and helps maintain healthy breastfeeding.',onTap: (){
            cubit.moveToUserGuide5();
          },
              img: ImageConstants.UserGuide4
          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}
