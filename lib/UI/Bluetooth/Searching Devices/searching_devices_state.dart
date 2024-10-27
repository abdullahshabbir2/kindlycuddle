import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SearchingDevicesState {
  final List<BluetoothDeviceInfo> devices;
  final bool isLoading;
  final Stream<List<ScanResult>> bluetoothDevices;
  final List<ScanResult> scanResults;
  SearchingDevicesState({
    required this.devices,
    required this.isLoading,
    required this.bluetoothDevices,
    required this.scanResults
});

  factory SearchingDevicesState.initial({required SearchingDevicesInitialParams initialParams}) =>
      SearchingDevicesState(
        devices: [],
        isLoading: false,
        bluetoothDevices: const Stream.empty(),
        scanResults: []
  );

  SearchingDevicesState copyWith({
    List<BluetoothDeviceInfo>? devices,
    bool? isLoading,
    Stream<List<ScanResult>>? bluetoothDevices,
    List<ScanResult>? scanResults,
  }) =>
      SearchingDevicesState(
        devices: devices ?? this.devices,
        isLoading: isLoading ?? this.isLoading,
        bluetoothDevices: bluetoothDevices ?? this.bluetoothDevices,
        scanResults: scanResults ?? this.scanResults
      );
}