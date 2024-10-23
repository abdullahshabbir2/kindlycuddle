import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';

import 'device_connected_successfully_initial_params.dart';

class DeviceConnectedSuccessfullyState {
  final BluetoothDeviceInfo device;
  DeviceConnectedSuccessfullyState({
    required this.device
});

  factory DeviceConnectedSuccessfullyState.initial({required DeviceConnectedSuccessfullyInitialParams initialParams}) =>
      DeviceConnectedSuccessfullyState(
        device: BluetoothDeviceInfo.empty()
  );

  DeviceConnectedSuccessfullyState copyWith({
    BluetoothDeviceInfo? device
  }) =>
      DeviceConnectedSuccessfullyState(
        device: device ?? this.device
      );
}