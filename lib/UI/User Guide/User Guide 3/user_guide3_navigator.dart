import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_page.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

class UserGuide3Navigator with UserGuide3Route,UserGuide4Route{
  UserGuide3Navigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin UserGuide3Route{
  openUserGuide3Page(UserGuide3InitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UserGuide3Page(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}