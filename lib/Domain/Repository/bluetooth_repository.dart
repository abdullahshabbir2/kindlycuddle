import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:cuddle_care/Domain/Failure/search_for_devices_failure.dart';
import 'package:dartz/dartz.dart';

abstract class BluetoothRepository{
  Future<Either<SearchForDevicesFailure, List<BluetoothDeviceInfo>>> searchForDevices();

}