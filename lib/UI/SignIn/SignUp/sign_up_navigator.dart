import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Bluetooth%20Permissions/bluetooth_permission_navigator.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class SignUpNavigator with SignUpRoute,BluetoothPermissionRoute{
  SignUpNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin SignUpRoute{
  openSignUpPage(SignUpInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SignUpPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}