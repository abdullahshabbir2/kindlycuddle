import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_page.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_navigator.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class UserGuide4Navigator with UserGuide4Route, UserGuide5Route{
  UserGuide4Navigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin UserGuide4Route{
  openUserGuide4Page(UserGuide4InitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UserGuide4Page(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}