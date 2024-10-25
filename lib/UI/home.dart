// import 'package:test_breastpump/ble_controller.dart';
// import 'package:flutter/material.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

import 'package:cuddle_care/Service/ble/ble_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  final BleController bleController = Get.put(BleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLE SCANNER")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              bleController.isConnected.value ? "Connected" : "Disconnected",
              style: TextStyle(
                  color: bleController.isConnected.value ? Colors.green : Colors.red,
                  fontSize: 18),
            )),
            Obx(() => Text(
              "Received Data: ${bleController.receivedData.value}",
              style: const TextStyle(fontSize: 16),
            )),
            StreamBuilder<List<ScanResult>>(
              stream: bleController.scanResults,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data![index];
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(data.device.name),
                            subtitle: Text(data.device.id.id),
                            trailing: Text(data.rssi.toString()),
                            onTap:(){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => DevicePairingPage(cubit: getIt(param1: DevicePairingInitialParams()), device: data.device) ));
                            }
                                // () => bleController.connectToDevice(data.device),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No Device Found"),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                bleController.scanDevices();
              },
              child: const Text("SCAN"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await bleController.disconnectDevice();
              },
              child: const Text("DISCONNECT"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                bleController.controlOnOff(1); // Turn On
              },
              child: const Text("Turn On"),
            ),
            ElevatedButton(
              onPressed: () {
                bleController.controlOnOff(0); // Turn Off
              },
              child: const Text("Turn Off"),
            ),
            ElevatedButton(
              onPressed: () {
                bleController.controlMaxWorkingHours(120); // Set Max Working Hours to 120 minutes
              },
              child: const Text("Set Max Working Hours"),
            ),
            ElevatedButton(
              onPressed: () {
                bleController.controlPause(1); // Pause
              },
              child: const Text("Pause"),
            ),
            ElevatedButton(
              onPressed: () {
                bleController.controlPause(0); // Resume
              },
              child: const Text("Resume"),
            ),
          ],
        ),
      ),
    );
  }
}