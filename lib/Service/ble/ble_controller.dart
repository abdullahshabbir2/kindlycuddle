// import 'package:flutter_blue/flutter_blue.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class BleController extends GetxController {
//   FlutterBlue ble = FlutterBlue.instance;
//   BluetoothDevice? connectedDevice;
//   RxBool isConnected = false.obs;
//   RxString receivedData = ''.obs;
//   RxString status = ''.obs;
//   RxString mode = ''.obs;
//   RxString battery = ''.obs;
//   RxString timeRemaining = ''.obs;
//   RxString onOff = ''.obs;
//   RxString currentHours = ''.obs;
//   RxString maxWorkingHours = ''.obs;
//   RxString pauseStatus = ''.obs;
//   RxString chargeStatus = ''.obs;
//
//   // UUIDs
//   final String serviceUUID = "0000FFB0-0000-1000-8000-00805F9B34FB";
//   final String characteristicUUIDRead = "0000FFB2-0000-1000-8000-00805F9B34FB";
//   final String characteristicUUIDWrite = "0000FFB1-0000-1000-8000-00805F9B34FB";
//
//   // Buffer to accumulate data
//   List<int> buffer = [];
//
//   // Scan for nearby BLE devices
//   Future scanDevices() async {
//     if (await Permission.bluetoothScan.request().isGranted) {
//       if (await Permission.bluetoothConnect.request().isGranted) {
//         ble.startScan(timeout: const Duration(seconds: 15));
//         ble.stopScan();
//       }
//     }
//   }
//
//   // Connect to a BLE device
//   Future<void> connectToDevice(BluetoothDevice device) async {
//     await device.connect(timeout: const Duration(seconds: 15));
//     connectedDevice = device;
//
//     device.state.listen((state) {
//       if (state == BluetoothDeviceState.connecting) {
//         print("Device connecting to: ${device.name}");
//         isConnected.value = false;
//       } else if (state == BluetoothDeviceState.connected) {
//         print("Device connected: ${device.name}");
//         isConnected.value = true;
//         enableNotifications(); // Automatically enable notifications
//       } else {
//         print("Device disconnected");
//         isConnected.value = false;
//         connectedDevice = null;
//       }
//     });
//   }
//
//   // Disconnect from BLE device
//   Future<void> disconnectDevice() async {
//     if (connectedDevice != null) {
//       await connectedDevice!.disconnect();
//       print("Disconnected from ${connectedDevice!.name}");
//       isConnected.value = false;
//       connectedDevice = null;
//     } else {
//       print("No device connected");
//     }
//   }
//
//   // Enable notifications for data
//   Future<void> enableNotifications() async {
//     if (connectedDevice != null) {
//       try {
//         var services = await connectedDevice!.discoverServices();
//         var service = services.firstWhere(
//               (s) => s.uuid.toString().toUpperCase() == serviceUUID.toUpperCase(),
//           orElse: () => throw Exception("Service not found"),
//         );
//         var characteristic = service.characteristics.firstWhere(
//               (c) => c.uuid.toString().toUpperCase() == characteristicUUIDRead.toUpperCase(),
//           orElse: () => throw Exception("Characteristic not found"),
//         );
//
//         await characteristic.setNotifyValue(true);
//         characteristic.value.listen((value) {
//           processIncomingData(value);
//         });
//         print("Notifications enabled for characteristic: $characteristicUUIDRead");
//       } catch (e) {
//         print("Error enabling notifications: $e");
//       }
//     }
//   }
//
//   // Write data to BLE device
//   Future<void> writeData(List<int> data) async {
//     if (connectedDevice != null) {
//       try {
//         var services = await connectedDevice!.discoverServices();
//         var service = services.firstWhere(
//               (s) => s.uuid.toString().toUpperCase() == serviceUUID.toUpperCase(),
//           orElse: () => throw Exception("Service not found"),
//         );
//         var characteristic = service.characteristics.firstWhere(
//               (c) => c.uuid.toString().toUpperCase() == characteristicUUIDWrite.toUpperCase(),
//           orElse: () => throw Exception("Characteristic not found"),
//         );
//
//         await characteristic.write(data, withoutResponse: true);
//         print("Data written: $data");
//       } catch (e) {
//         print("Error writing data: $e");
//       }
//     }
//   }
//
//   // Generate command for On/Off Control
//   void controlOnOff(int status) {
//     int checksum = (0x55 + 0xAA + 0x06 + 0x10 + status) & 0xFF;
//     List<int> command = [0x55, 0xAA, 0x06, 0x10, status, checksum];
//     writeData(command);
//   }
//
//   // Generate command for Max Working Hours Control
//   void controlMaxWorkingHours(int hours) {
//     int checksum = (0x55 + 0xAA + 0x06 + 0x90 + hours) & 0xFF;
//     List<int> command = [0x55, 0xAA, 0x06, 0x90, hours, checksum];
//     writeData(command);
//   }
//
//   // Generate command for Pause Control
//   void controlPause(int status) {
//     int checksum = (0x55 + 0xAA + 0x06 + 0xD0 + status) & 0xFF;
//     List<int> command = [0x55, 0xAA, 0x06, 0xD0, status, checksum];
//     writeData(command);
//   }
//
//   // Process incoming BLE data
//   void processIncomingData(List<int> data) {
//     for (var byte in data) {
//       if (byte == 0x55) {
//         if (buffer.isNotEmpty) {
//           parseMessage(buffer);
//           buffer.clear();
//         }
//       }
//       buffer.add(byte);
//     }
//   }
//
//   // Parse the incoming message
//   void parseMessage(List<int> message) {
//     if (message.length < 6) {
//       print("Invalid message length");
//       return;
//     }
//
//     int header1 = message[0];
//     int header2 = message[1];
//     int length = message[2];
//     int function = message[3];
//
//     if (header1 == 0x55 && header2 == 0xAA) {
//       switch (function) {
//         case 0x00: // Update Version
//           if (length == 8) {
//             String version = "${message[4]}.${message[5]}.${message[6]}";
//             receivedData.value = "Version: $version";
//           }
//           break;
//         case 0x01: // Update On/Off
//           if (length == 6) {
//             int onOffStatus = message[4];
//             onOff.value = onOffStatus == 0 ? "Off" : "On";
//             receivedData.value = "On/Off Status: $onOff";
//           }
//           break;
//         case 0x02: // Update Status
//           if (length == 6) {
//             int modeStatus = message[4];
//             switch (modeStatus) {
//               case 0:
//                 mode.value = "Breast";
//                 break;
//               case 1:
//                 mode.value = "Stimulate";
//                 break;
//               case 2:
//                 mode.value = "Auto";
//                 break;
//               case 3:
//                 mode.value = "Massage";
//                 break;
//               default:
//                 mode.value = "Unknown";
//             }
//             receivedData.value = "Mode Status: $mode";
//           }
//           break;
//         case 0x09: // Update Current Hours
//           if (length == 7) {
//             int current = message[4];
//             int maxHours = message[5];
//             currentHours.value = "$current min";
//             maxWorkingHours.value = "$maxHours min";
//             receivedData.value = "Current Hours: $currentHours, Max Hours: $maxWorkingHours";
//           }
//           break;
//         case 0x0A: // Update Battery Level
//           if (length == 6) {
//             int batteryLevel = message[4];
//             battery.value = "$batteryLevel%";
//             receivedData.value = "Battery Level: $battery";
//           }
//           break;
//         case 0x0D: // Update Pause Status
//           if (length == 6) {
//             int pause = message[4];
//             pauseStatus.value = pause == 0 ? "Start" : "Pause";
//             receivedData.value = "Pause Status: $pauseStatus";
//           }
//           break;
//         case 0x0E: // Update Charge Status
//           if (length == 6) {
//             int charge = message[4];
//             switch (charge) {
//               case 0:
//                 chargeStatus.value = "Idle";
//                 break;
//               case 1:
//                 chargeStatus.value = "Charging";
//                 break;
//               case 2:
//                 chargeStatus.value = "Full";
//                 break;
//               case 3:
//                 chargeStatus.value = "Error";
//                 break;
//               default:
//                 chargeStatus.value = "Unknown";
//             }
//             receivedData.value = "Charge Status: $chargeStatus";
//           }
//           break;
//         default:
//           print("Unknown function code");
//       }
//     }
//
//     // Print the parsed data
//     print("Parsed Data: ${receivedData.value}, Status: ${status.value}, Mode: ${mode.value}, "
//         "On/Off: ${onOff.value}, Current Hours: ${currentHours.value}, Max Working Hours: ${maxWorkingHours.value}, "
//         "Battery: ${battery.value}, Pause: ${pauseStatus.value}, Charge: ${chargeStatus.value}");
//   }
//
//   Stream<List<ScanResult>> get scanResults => ble.scanResults;
// }
//
//


import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  FlutterBluePlus ble = FlutterBluePlus();
  BluetoothDevice? connectedDevice;
  RxBool isConnected = false.obs;
  RxString receivedData = ''.obs;
  RxString status = ''.obs;
  RxString mode = ''.obs;
  RxString battery = ''.obs;
  RxString timeRemaining = ''.obs;
  RxString onOff = ''.obs;
  RxString currentHours = ''.obs;
  RxString maxWorkingHours = ''.obs;
  RxString pauseStatus = ''.obs;
  RxString chargeStatus = ''.obs;

  // UUIDs
  final String serviceUUID = "ffb0";
  final String characteristicUUIDRead = "ffb2";
  final String characteristicUUIDWrite = "ffb1";

  // Buffer to accumulate data
  List<int> buffer = [];

  // Scan for nearby BLE devices
  Future<void> scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted) {
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
      await Future.delayed(const Duration(seconds: 15));
      FlutterBluePlus.stopScan();
    } else {
      print("Permissions not granted for scanning.");
    }
  }

  // Connect to a BLE device
  Future<void> connectToDevice(BluetoothDevice device) async {
    if (connectedDevice != null && isConnected.value) {
      await disconnectDevice();
    }
    try {
      await device.connect(timeout: const Duration(seconds: 15));
      connectedDevice = device;
      _monitorConnectionState();
    } catch (e) {
      print("Error connecting to device: $e");
    }
  }

  // Monitor the connection state changes
  void _monitorConnectionState() {
    if (connectedDevice != null) {
      connectedDevice!.connectionState.listen((state) {
        if (state == BluetoothConnectionState.connected) {
          print("Connected to ${connectedDevice!.name}");
          isConnected.value = true;
          enableNotifications();
        } else if (state == BluetoothConnectionState.disconnected) {
          print("Disconnected from ${connectedDevice!.name}");
          isConnected.value = false;
          connectedDevice = null;
        }
      });
    }
  }

  // Disconnect from BLE device
  Future<void> disconnectDevice() async {
    if (connectedDevice != null) {
      try {
        await connectedDevice!.disconnect();
        print("Disconnected from ${connectedDevice!.name}");
        isConnected.value = false;
        connectedDevice = null;
      } catch (e) {
        print("Error disconnecting: $e");
      }
    } else {
      print("No device connected");
    }
  }

  // Enable notifications for data
  Future<void> enableNotifications() async {
    if (connectedDevice == null) return;

    try {
      var services = await connectedDevice!.discoverServices();
      var service = services.firstWhere(
            (s) => s.uuid.toString().toUpperCase() == serviceUUID.toUpperCase(),
        orElse: () => throw Exception("Service $serviceUUID not found"),
      );

      var characteristic = service.characteristics.firstWhere(
            (c) => c.uuid.toString().toUpperCase() == characteristicUUIDRead.toUpperCase(),
        orElse: () => throw Exception("Characteristic $characteristicUUIDRead not found"),
      );

      await characteristic.setNotifyValue(true);
      characteristic.value.listen((value) {
        processIncomingData(value);
      });
      print("Notifications enabled for characteristic: $characteristicUUIDRead");
    } catch (e) {
      print("Failed to enable notifications: $e");
    }
  }

  // Write data to BLE device
  Future<void> writeData(List<int> data) async {
    if (connectedDevice != null) {
      try {
        var services = await connectedDevice!.discoverServices();
        var service = services.firstWhere(
              (s) => s.uuid.toString().toUpperCase() == serviceUUID.toUpperCase(),
          orElse: () => throw Exception("Service not found"),
        );
        var characteristic = service.characteristics.firstWhere(
              (c) => c.uuid.toString().toUpperCase() == characteristicUUIDWrite.toUpperCase(),
          orElse: () => throw Exception("Characteristic not found"),
        );

        await characteristic.write(data, withoutResponse: true);
        print("Data written: $data");
      } catch (e) {
        print("Error writing data: $e");
      }
    }
  }

  // Generate command for On/Off Control
  void controlOnOff(int status) {
    int checksum = (0x55 + 0xAA + 0x06 + 0x10 + status) & 0xFF;
    List<int> command = [0x55, 0xAA, 0x06, 0x10, status, checksum];
    writeData(command);
  }
  // Generate command for Max Working Hours Control
  void controlMaxWorkingHours(int hours) {
    int checksum = (0x55 + 0xAA + 0x06 + 0x90 + hours) & 0xFF;
    List<int> command = [0x55, 0xAA, 0x06, 0x90, hours, checksum];
    writeData(command);
  }

  // Generate command for Pause Control
  void controlPause(int status) {
    int checksum = (0x55 + 0xAA + 0x06 + 0xD0 + status) & 0xFF;
    List<int> command = [0x55, 0xAA, 0x06, 0xD0, status, checksum];
    writeData(command);
  }

  // Process incoming BLE data
  void processIncomingData(List<int> data) {
    buffer.addAll(data);
    while (buffer.length >= 6) {
      if (buffer[0] == 0x55) {
        int messageLength = buffer[2];
        if (buffer.length >= messageLength) {
          parseMessage(buffer.sublist(0, messageLength));
          buffer.removeRange(0, messageLength);
        } else {
          break; // Wait for more data
        }
      } else {
        buffer.removeAt(0); // Discard invalid data
      }
    }
  }

  // Parse the incoming message
  void parseMessage(List<int> message) {
    if (message.length < 6) {
      print("Invalid message length");
      return;
    }

    int header1 = message[0];
    int header2 = message[1];
    int length = message[2];
    int function = message[3];

    if (header1 == 0x55 && header2 == 0xAA) {
      switch (function) {
        case 0x00: // Update Version
          if (length == 8) {
            String version = "${message[4]}.${message[5]}.${message[6]}";
            receivedData.value = "Version: $version";
          }
          break;
        case 0x01: // Update On/Off
          if (length == 6) {
            int onOffStatus = message[4];
            onOff.value = onOffStatus == 0 ? "Off" : "On";
            receivedData.value = "On/Off Status: $onOff";
          }
          break;
        case 0x02: // Update Status
          if (length == 6) {
            int modeStatus = message[4];
            switch (modeStatus) {
              case 0:
                mode.value = "Breast";
                break;
              case 1:
                mode.value = "Stimulate";
                break;
              case 2:
                mode.value = "Auto";
                break;
              case 3:
                mode.value = "Massage";
                break;
              default:
                mode.value = "Unknown";
            }
            receivedData.value = "Mode Status: $mode";
          }
          break;
        case 0x09: // Update Current Hours
          if (length == 7) {
            int current = message[4];
            int maxHours = message[5];
            currentHours.value = "$current min";
            maxWorkingHours.value = "$maxHours min";
            receivedData.value = "Current Hours: $currentHours, Max Hours: $maxWorkingHours";
          }
          break;
        case 0x0A: // Update Battery Level
          if (length == 6) {
            int batteryLevel = message[4];
            battery.value = "$batteryLevel%";
            receivedData.value = "Battery Level: $battery";
          }
          break;
        case 0x0D: // Update Pause Status
          if (length == 6) {
            int pause = message[4];
            pauseStatus.value = pause == 0 ? "Start" : "Pause";
            receivedData.value = "Pause Status: $pauseStatus";
          }
          break;
        case 0x0E: // Update Charge Status
          if (length == 6) {
            int charge = message[4];
            switch (charge) {
              case 0:
                chargeStatus.value = "Idle";
                break;
              case 1:
                chargeStatus.value = "Charging";
                break;
              case 2:
                chargeStatus.value = "Full";
                break;
              case 3:
                chargeStatus.value = "Error";
                break;
              default:
                chargeStatus.value = "Unknown";
            }
            receivedData.value = "Charge Status: $chargeStatus";
          }
          break;
        default:
          print("Unknown function code");
      }
    }

    // Print the parsed data
    print("Parsed Data: ${receivedData.value}, Status: ${status.value}, Mode: ${mode.value}, "
        "On/Off: ${onOff.value}, Current Hours: ${currentHours.value}, Max Working Hours: ${maxWorkingHours.value}, "
        "Battery: ${battery.value}, Pause: ${pauseStatus.value}, Charge: ${chargeStatus.value}");
  }

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;
}