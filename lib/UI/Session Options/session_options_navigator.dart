import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'session_options_initial_params.dart';

class SessionOptionsNavigator {
  SessionOptionsNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin SessionOptionsRoute{
  openSessionOptionsPage(SessionOptionsInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SessionOptionsPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}