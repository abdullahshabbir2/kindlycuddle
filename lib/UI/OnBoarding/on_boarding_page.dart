import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/OnBoarding/OnBoarding%20ReUseAble/screen_indicator.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_cubit.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_initial_params.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatefulWidget {
  final OnBoardingCubit cubit;
  // final UserDeInitialParams initialParams;
  const OnBoardingPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  OnBoardingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(OnBoardingInitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 43.5.h,),
              AssetsImages(path: ImageConstants.kindlyCuddle,height: 50),
              SizedBox(height: 27.h,),
              AssetsImages(path: ImageConstants.pngCuddleCareScreenImage),
              SizedBox(height: 23.h,),
              Center(child: headingText('Nurturing Moments, Simplified')),
              SizedBox(height: 8.h,),
              Center(child: bodyText('Effortlessly track and manage your \nbreastfeeding sessions with Kindly Cuddle.')),
              SizedBox(height: 24.h,),
              ScreenIndicator(1),
              SizedBox(height: 14.h,),
              StyledButton(text: 'Get Started',onTap: cubit.moveToNextScreen,)
            ],
          ),
        ),
      ),
      designSize: const Size(376.0, 812.0),
    );
  }
}
