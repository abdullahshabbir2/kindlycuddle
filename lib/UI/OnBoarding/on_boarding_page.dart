import 'package:cuddle_care/UI/OnBoarding/on_boarding_cubit.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_initial_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          body: Column(
            children: [

            ],
          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}
