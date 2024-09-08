import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_page.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'on_boarding_initial_params.dart';

class OnBoardingNavigator with OnBoardingRoute , SignInRoute{
  OnBoardingNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin OnBoardingRoute{
  openOnBoardingPage(OnBoardingInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => OnBoardingPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}