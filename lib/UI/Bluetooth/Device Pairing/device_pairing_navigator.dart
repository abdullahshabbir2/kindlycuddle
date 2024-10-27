import 'package:cuddle_care/Navigation/app_navigator.dart';

import 'package:flutter/material.dart';

class DevicePairingNavigator {
  DevicePairingNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

// mixin DevicePairingRoute{
//   openDevicePairingPage(DevicePairingInitialParams initialParams)
//   {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => DevicePairingPage(cubit: getIt(param1: initialParams),))
//     );
//   }
//   BuildContext get context;
//   AppNavigator get navigator;
// }