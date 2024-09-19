import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_navigator.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'bluetooth_permission_initial_params.dart';
import 'bluetooth_permission_page.dart';

class BluetoothPermissionNavigator with BluetoothPermissionRoute,SearchingDevicesRoute{
  BluetoothPermissionNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin BluetoothPermissionRoute{
  openBluetoothPermissionPage(BluetoothPermissionInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => BluetoothPermissionPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}