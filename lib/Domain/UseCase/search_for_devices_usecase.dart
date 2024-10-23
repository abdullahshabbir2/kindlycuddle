import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:cuddle_care/Domain/Repository/bluetooth_repository.dart';
import 'package:dartz/dartz.dart';

import '../Failure/search_for_devices_failure.dart';

class SearchForDevicesUseCase{
  final BluetoothRepository repository;
  SearchForDevicesUseCase(this.repository);

  Future<Either< SearchForDevicesFailure , List<BluetoothDeviceInfo> >> execute(){
    return repository.searchForDevices();
  }

}