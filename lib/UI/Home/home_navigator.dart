import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_navigator.dart';
//import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_navigator.dart';
import 'package:flutter/material.dart';


class HomeNavigator with SessionOptionsRoute {
  HomeNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

// mixin HomeRoute{
//   openHomePage(HomeInitialParams initialParams)
//   {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => HomePage(cubit: getIt(param1: initialParams),))
//     );
//   }
//   BuildContext get context;
//   AppNavigator get navigator;
// }