import 'package:bloc/bloc.dart';
import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:flutter/cupertino.dart';

class DeviceStore extends Cubit<BluetoothDeviceInfo>
{
  DeviceStore() : super( BluetoothDeviceInfo());

  setDevice(BluetoothDeviceInfo device){
    emit(device);
    debugPrint('device set successfully');
  }

}