import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Home/home_navigator.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_navigator.dart';
import 'package:cuddle_care/UI/Splash/splash_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'Splash_initial_params.dart';

class SplashNavigator with SplashRoute , OnBoardingRoute , HomeRoute {
  SplashNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin SplashRoute{
  openSplashPage(SplashInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SplashPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}