import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Home/home_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'device_connected_successfully_initial_params.dart';
import 'device_connected_successfully_page.dart';

class DeviceConnectedSuccessfullyNavigator with DeviceConnectedSuccessfullyRoute, HomeRoute{
  DeviceConnectedSuccessfullyNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin DeviceConnectedSuccessfullyRoute{
  openDeviceConnectedSuccessfullyPage(DeviceConnectedSuccessfullyInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DeviceConnectedSuccessfullyPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}