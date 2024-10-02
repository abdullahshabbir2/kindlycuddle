import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_page.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

class UserGuide2Navigator with UserGuide2Route, UserGuide3Route{
  UserGuide2Navigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin UserGuide2Route{
  openUserGuide2Page(UserGuide2InitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UserGuide2Page(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}