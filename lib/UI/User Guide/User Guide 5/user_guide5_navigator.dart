import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

class UserGuide5Navigator with UserGuide5Route{
  UserGuide5Navigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin UserGuide5Route{
  openUserGuide5Page(UserGuide5InitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UserGuide5Page(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}