import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_page.dart';
//import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

class UserGuide1Navigator with UserGuide1Route {
  UserGuide1Navigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;
}

mixin UserGuide1Route {
  openUserGuide1Page(UserGuide1InitialParams initialParams) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserGuide1Page(
              cubit: getIt(param1: initialParams),
            )));
  }

  BuildContext get context;
  AppNavigator get navigator;
}
