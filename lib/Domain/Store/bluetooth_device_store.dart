import 'package:bloc/bloc.dart';
import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDeviceStore extends Cubit<BluetoothDevice?>
{
  BluetoothDeviceStore() : super( null );

  setDevice(BluetoothDevice device){
    emit(device);
    debugPrint('device set successfully');
  }

}