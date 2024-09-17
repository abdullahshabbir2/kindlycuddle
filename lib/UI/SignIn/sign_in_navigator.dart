import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_navigator.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

class SignInNavigator with SignInRoute,SignUpRoute{
  SignInNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin SignInRoute{
  openSignInPage(SignInInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SignInPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}