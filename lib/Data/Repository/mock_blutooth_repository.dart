import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:cuddle_care/Domain/Failure/search_for_devices_failure.dart';
import 'package:cuddle_care/Domain/Repository/bluetooth_repository.dart';
import 'package:dartz/dartz.dart';

class MockBluetoothRepository implements BluetoothRepository{
  @override
  Future<Either<SearchForDevicesFailure, List<BluetoothDeviceInfo>>> searchForDevices() async {
    // TODO: implement searchForDevices
    return right([
      BluetoothDeviceInfo(id: '1111', name: 'Pump 1', rssi: '111'),
      BluetoothDeviceInfo(id: '2222', name: 'Pump 2', rssi: '222'),
      BluetoothDeviceInfo(id: '3333', name: 'Pump 3', rssi: '333'),
    ]);
  }

}