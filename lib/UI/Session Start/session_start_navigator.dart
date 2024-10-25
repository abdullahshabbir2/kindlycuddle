import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_page.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%201/user_guide1_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'session_start_initial_params.dart';

class SessionStartNavigator with  UserGuide1Route{
  SessionStartNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

// mixin SessionStartRoute{
//   openSessionStartPage(SessionStartInitialParams initialParams)
//   {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => SessionStartPage(cubit: getIt(param1: initialParams),))
//     );
//   }
//   BuildContext get context;
//   AppNavigator get navigator;
// }