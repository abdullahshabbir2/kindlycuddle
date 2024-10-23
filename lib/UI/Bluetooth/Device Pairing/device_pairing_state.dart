
import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';

import 'device_pairing_initial_params.dart';

class DevicePairingState {
  final BluetoothDeviceInfo deviceInfo;
  DevicePairingState({
    required this.deviceInfo
});

  factory DevicePairingState.initial({required DevicePairingInitialParams initialParams}) =>
      DevicePairingState(
        deviceInfo: BluetoothDeviceInfo.empty()
  );

  DevicePairingState copyWith({
    BluetoothDeviceInfo? deviceInfo
}) =>
      DevicePairingState(
        deviceInfo: deviceInfo ?? this.deviceInfo
      );
}