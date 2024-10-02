import 'package:cuddle_care/UI/User%20Guide/ReUseAble/user_guide.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_cubit.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_initial_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide3Page extends StatefulWidget {
  final UserGuide3Cubit cubit;
  // final UserDeInitialParams initialParams;
  const UserGuide3Page({Key? key, required this.cubit}) : super(key: key);


  @override
  State<UserGuide3Page> createState() => _UserGuide3PageState();
}

class _UserGuide3PageState extends State<UserGuide3Page> {

  UserGuide3Cubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(UserGuide3InitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: UserGuide(heading: 'Cleaning', body: 'Keep your pump clean with our specialized brushes, sold separately. Regular cleaning ensures hygiene and extends the lifespan of your device.',onTap: (){
            cubit.moveToUserGuide4();
          },),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}
