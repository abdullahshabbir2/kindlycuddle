import 'dart:async';
import 'dart:ui' as ui;

import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/Service/ble/ble_controller.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_page.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/circles.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_cubit.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_state.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../ReUseAble/heading_text.dart';
import '../../ReUseAble/styled_button.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class SearchingDevicesPage extends StatefulWidget {
  final SearchingDevicesCubit cubit;
  // final UserDeInitialParams initialParams;
  const SearchingDevicesPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<SearchingDevicesPage> createState() => _SearchingDevicesPageState();
}

class _SearchingDevicesPageState extends State<SearchingDevicesPage> {

  SearchingDevicesCubit get cubit => widget.cubit;

  final BleController bleController = Get.put(BleController());

  // Stream<List<ScanResult>> devices = Stream.empty();


  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(SearchingDevicesInitialParams());
   cubit.navigator.context =  context;

   // cubit.searchForDevices();
   // bleController.scanDevices();

   // cubit.getDevices();


  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 43.5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AssetsImages(path: ImageConstants.kindlyCuddle,height: 50),

                ],
              ),
              SizedBox(height: 30.h,),

              // BlocBuilder(
              //     bloc: cubit,
              //     builder: (context , state) {
              //       state as SearchingDevicesState;
              //       return ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: 3,
              //           itemBuilder: (context,index){
              //             return SizedBox(
              //               width: MediaQuery.of(context).size.width * 0.5,
              //               child: InkWell(
              //                 onTap: (){
              //                   cubit.setValueToDeviceStore(state.devices[index]);
              //                 },
              //                 child: Card(
              //                   child: Text(state.devices[index].name??''),
              //                 ),
              //               ),
              //             );
              //           }
              //       );
              //     }
              // ),


              // BlocBuilder(
              //   bloc: cubit,
              //   builder: (context , state) {
              //     state as SearchingDevicesState;
              //
              //     if(state.isLoading){
              //       return CircularProgressIndicator();
              //     }
              //
              //     return Expanded(
              //       child: ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: state.scanResults.length,
              //         itemBuilder: (context, index) {
              //           final data = state.scanResults[index];
              //           return Card(
              //             elevation: 2,
              //             child: ListTile(
              //               title: Text(data.device.name),
              //               subtitle: Text(data.device.id.id),
              //               trailing: Text(data.rssi.toString()),
              //               onTap: () async {
              //                 // await bleController.connectToDevice(data.device);
              //
              //                 cubit.setBluetoothDevice(data.device);
              //
              //                 Navigator.of(context).push(
              //                     MaterialPageRoute(
              //                         builder: (context) => DevicePairingPage(
              //                             device: data.device,
              //                             cubit: getIt(
              //                                 param1: DevicePairingInitialParams()
              //                             ))
              //                     ));
              //
              //                 // cubit.moveToNextScreen(data.device);
              //               },
              //             ),
              //           );
              //         },
              //       ),
              //     );
              //   }
              // ),



              // BlocBuilder(
              //     bloc: cubit,
              //     builder: (context , state) {
              //       state as SearchingDevicesState;
              //
              //       if(state.isLoading){
              //         debugPrint('is Loading');
              //         return const CircularProgressIndicator();
              //       }
              //       else{
              //         debugPrint('not is Loading');
              //         return StreamBuilder<List<ScanResult>>(
              //           stream: bleController.scanResults,
              //           builder: (context, snapshot) {
              //             if (snapshot.hasData) {
              //               return Expanded(
              //                 child: ListView.builder(
              //                   shrinkWrap: true,
              //                   itemCount: snapshot.data!.length,
              //                   itemBuilder: (context, index) {
              //                     final data = snapshot.data![index];
              //                     return Card(
              //                       elevation: 2,
              //                       child: ListTile(
              //                         title: Text(data.device.name),
              //                         subtitle: Text(data.device.id.id),
              //                         trailing: Text(data.rssi.toString()),
              //                         onTap: () async {
              //                           // await bleController.connectToDevice(data.device);
              //
              //                           cubit.setBluetoothDevice(data.device);
              //
              //                           Navigator.of(context).push(
              //                               MaterialPageRoute(
              //                                   builder: (context) => DevicePairingPage(
              //                                       device: data.device,
              //                                       cubit: getIt(
              //                                           param1: DevicePairingInitialParams()
              //                                       ))
              //                               ));
              //
              //                           // cubit.moveToNextScreen(data.device);
              //                         },
              //                       ),
              //                     );
              //                   },
              //                 ),
              //               );
              //             }
              //             else {
              //               return const Center(
              //                 child: Text("No Device Found"),
              //               );
              //             }
              //           },
              //         );
              //       }
              //
              //     }
              // ),



              // StreamBuilder<List<ScanResult>>(
              //   stream: bleController.scanResults,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Expanded(
              //         child: ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: snapshot.data!.length,
              //           itemBuilder: (context, index) {
              //             final data = snapshot.data![index];
              //             return Card(
              //               elevation: 2,
              //               child: ListTile(
              //                 title: Text(data.device.name),
              //                 subtitle: Text(data.device.id.id),
              //                 trailing: Text(data.rssi.toString()),
              //                 onTap: () async {
              //                   // await bleController.connectToDevice(data.device);
              //
              //                   cubit.setBluetoothDevice(data.device);
              //
              //                   Navigator.of(context).push(
              //                       MaterialPageRoute(
              //                           builder: (context) => DevicePairingPage(
              //                               device: data.device,
              //                               cubit: getIt(
              //                                   param1: DevicePairingInitialParams()
              //                               ))
              //                       ));
              //
              //                   // cubit.moveToNextScreen(data.device);
              //                 },
              //               ),
              //             );
              //           },
              //         ),
              //       );
              //     }
              //     else {
              //       return const Center(
              //         child: Text("No Device Found"),
              //       );
              //     }
              //   },
              // ),

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
                              // onTap: () => bleController.connectToDevice(data.device),
                                onTap:(){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => DevicePairingPage(cubit: getIt(param1: DevicePairingInitialParams()), device: data.device) ));
                                }
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
              // ElevatedButton(
              //   onPressed: () async {
              //     bleController.scanDevices();
              //   },
              //   child: const Text("SCAN"),
              // ),

              // Center(
              //   child: Column(
              //     // mainAxisAlignment: MainAxisAlignment.center,
              //     // crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       // SizedBox(height: 193.h,),
              //       // ReUseAbleSvg(path: ImageConstants.bluetooth),
              //       SizedBox(height: 22.h,),
              //
              //
              //
              //       // Stack(
              //       //   alignment: Alignment.center, // Ensures everything is centered
              //       //   children: [
              //       //     // CustomPaint with defined size
              //       //     // CustomPaint(
              //       //     //   size: Size(300, 300), // Define the size for both circles and the SVG
              //       //     //   painter: CirclePainter(
              //       //     //     // image: Image(image: AssetImage(''),),
              //       //     //   ),
              //       //     // ),
              //       //
              //       //     // Circles(),
              //       //
              //       //
              //       //
              //       //     // FutureBuilder<ui.Image>(
              //       //     //   future: _loadImage(ImageConstants.pumpIconSmall), // Replace with your asset path
              //       //     //   builder: (context, snapshot) {
              //       //     //     if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              //       //     //       return BlocBuilder(
              //       //     //         bloc: cubit,
              //       //     //         builder: (context , state) {
              //       //     //           state as SearchingDevicesState;
              //       //     //           return Center(
              //       //     //             child: CustomPaint(
              //       //     //               size: const Size(200, 200),
              //       //     //               painter: CirclePainter(image: snapshot.data! , devices: state.devices ),
              //       //     //             ),
              //       //     //           );
              //       //     //         }
              //       //     //       );
              //       //     //     } else {
              //       //     //       return const Center(child: CircularProgressIndicator());
              //       //     //     }
              //       //     //   },
              //       //     // ),
              //       //
              //       //
              //       //
              //       //     // Center the SVG within the same sized container
              //       //     ReUseAbleSvg(path: ImageConstants.bluetooth), // Ensure this widget is centered
              //       //   ],
              //       // ),
              //
              //       StreamBuilder<List<ScanResult>>(
              //         stream: bleController.scanResults,
              //         builder: (context, snapshot) {
              //           if (snapshot.hasData) {
              //             return Expanded(
              //               child: ListView.builder(
              //                 shrinkWrap: true,
              //                 itemCount: snapshot.data!.length,
              //                 itemBuilder: (context, index) {
              //                   final data = snapshot.data![index];
              //                   return Card(
              //                     elevation: 2,
              //                     child: ListTile(
              //                       title: Text(data.device.name),
              //                       subtitle: Text(data.device.id.id),
              //                       trailing: Text(data.rssi.toString()),
              //                       onTap: () => bleController.connectToDevice(data.device),
              //                     ),
              //                   );
              //                 },
              //               ),
              //             );
              //           } else {
              //             return const Center(
              //               child: Text("No Device Found"),
              //             );
              //           }
              //         },
              //       ),
              //
              //
              //       // SizedBox(height: 100.h,),
              //       StyledButton(text: 'Turn Off', onTap: (){
              //         // cubit.moveToNextScreen();
              //       })
              //     ],
              //   ),
              // ),


              // Stack(
              //   children: [
              //     ReUseAbleSvg(path: ImageConstants.backgroundShape),
              //
              //     Center(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           // SizedBox(height: 193.h,),
              //           // ReUseAbleSvg(path: ImageConstants.bluetooth),
              //           SizedBox(height: 22.h,),
              //
              //
              //
              //           // Stack(
              //           //   alignment: Alignment.center, // Ensures everything is centered
              //           //   children: [
              //           //     // CustomPaint with defined size
              //           //     // CustomPaint(
              //           //     //   size: Size(300, 300), // Define the size for both circles and the SVG
              //           //     //   painter: CirclePainter(
              //           //     //     // image: Image(image: AssetImage(''),),
              //           //     //   ),
              //           //     // ),
              //           //
              //           //     // Circles(),
              //           //
              //           //
              //           //
              //           //     // FutureBuilder<ui.Image>(
              //           //     //   future: _loadImage(ImageConstants.pumpIconSmall), // Replace with your asset path
              //           //     //   builder: (context, snapshot) {
              //           //     //     if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              //           //     //       return BlocBuilder(
              //           //     //         bloc: cubit,
              //           //     //         builder: (context , state) {
              //           //     //           state as SearchingDevicesState;
              //           //     //           return Center(
              //           //     //             child: CustomPaint(
              //           //     //               size: const Size(200, 200),
              //           //     //               painter: CirclePainter(image: snapshot.data! , devices: state.devices ),
              //           //     //             ),
              //           //     //           );
              //           //     //         }
              //           //     //       );
              //           //     //     } else {
              //           //     //       return const Center(child: CircularProgressIndicator());
              //           //     //     }
              //           //     //   },
              //           //     // ),
              //           //
              //           //
              //           //
              //           //     // Center the SVG within the same sized container
              //           //     ReUseAbleSvg(path: ImageConstants.bluetooth), // Ensure this widget is centered
              //           //   ],
              //           // ),
              //
              //           StreamBuilder<List<ScanResult>>(
              //             stream: bleController.scanResults,
              //             builder: (context, snapshot) {
              //               if (snapshot.hasData) {
              //                 return Expanded(
              //                   child: ListView.builder(
              //                     shrinkWrap: true,
              //                     itemCount: snapshot.data!.length,
              //                     itemBuilder: (context, index) {
              //                       final data = snapshot.data![index];
              //                       return Card(
              //                         elevation: 2,
              //                         child: ListTile(
              //                           title: Text(data.device.name),
              //                           subtitle: Text(data.device.id.id),
              //                           trailing: Text(data.rssi.toString()),
              //                           onTap: () => bleController.connectToDevice(data.device),
              //                         ),
              //                       );
              //                     },
              //                   ),
              //                 );
              //               } else {
              //                 return const Center(
              //                   child: Text("No Device Found"),
              //                 );
              //               }
              //             },
              //           ),
              //
              //
              //           // SizedBox(height: 100.h,),
              //           // StyledButton(text: 'Turn Off', onTap: (){
              //           //   // cubit.moveToNextScreen();
              //           // })
              //           StyledButton(text: 'Scan', onTap: (){
              //             // cubit.moveToNextScreen();
              //             bleController.scanDevices();
              //           })
              //         ],
              //       ),
              //     ),
              //
              //
              //   ],
              // ),

              StyledButton(text: 'Scan', onTap: (){
              // cubit.moveToNextScreen();
                bleController.scanDevices();
            })

            ],
          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}

Future<ui.Image> _loadImage(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  final Completer<ui.Image> completer = Completer();
  ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
    completer.complete(img);
  });
  return completer.future;
}