import 'package:cuddle_care/UI/User%20Guide/ReUseAble/user_guide.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_cubit.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_initial_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide5Page extends StatefulWidget {
  final UserGuide5Cubit cubit;
  // final UserDeInitialParams initialParams;
  const UserGuide5Page({Key? key, required this.cubit}) : super(key: key);


  @override
  State<UserGuide5Page> createState() => _UserGuide5PageState();
}

class _UserGuide5PageState extends State<UserGuide5Page> {

  UserGuide5Cubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(UserGuide5InitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: UserGuide(heading: 'How to Store Breast Milk', body: 'Safely store your expressed milk using our milk bags. Proper storage ensures that your milk stays fresh and ready for your baby.',onTap: (){
            cubit.moveToNextScreen();
          },next: 'Continue',),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}
