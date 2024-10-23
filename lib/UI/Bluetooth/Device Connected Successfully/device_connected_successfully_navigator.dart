import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:flutter/material.dart';

class DeviceConnectedSuccessfullyNavigator {
  DeviceConnectedSuccessfullyNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

// mixin DeviceConnectedSuccessfullyRoute{
//   openDeviceConnectedSuccessfullyPage(DeviceConnectedSuccessfullyInitialParams initialParams)
//   {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => DeviceConnectedSuccessfullyPage(cubit: getIt(param1: initialParams),))
//     );
//   }
//   BuildContext get context;
//   AppNavigator get navigator;
// }