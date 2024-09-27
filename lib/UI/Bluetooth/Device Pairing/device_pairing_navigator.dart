import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Connected%20Successfully/device_connected_successfully_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'device_pairing_initial_params.dart';
import 'device_pairing_page.dart';

class DevicePairingNavigator with DevicePairingRoute,DeviceConnectedSuccessfullyRoute{
  DevicePairingNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin DevicePairingRoute{
  openDevicePairingPage(DevicePairingInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DevicePairingPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}