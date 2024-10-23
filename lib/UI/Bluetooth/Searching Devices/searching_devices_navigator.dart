import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'searching_devices_page.dart';

class SearchingDevicesNavigator with SearchingDevicesRoute{
  SearchingDevicesNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin SearchingDevicesRoute{
  openSearchingDevicesPage(SearchingDevicesInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SearchingDevicesPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}