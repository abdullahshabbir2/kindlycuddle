import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Profile/profile_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'Profile_initial_params.dart';

class ProfileNavigator with ProfileRoute{
  ProfileNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin ProfileRoute{
  openProfilePage(ProfileInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ProfilePage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}