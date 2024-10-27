
import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Domain/Entity/bluetooth_device_info.dart';
import 'package:cuddle_care/Domain/Store/bluetooth_device_store.dart';
import 'package:cuddle_care/Domain/Store/device_info_store.dart';
import 'package:cuddle_care/Domain/UseCase/search_for_devices_usecase.dart';
import 'package:cuddle_care/Service/ble/ble_controller.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_state.dart';
import 'package:cuddle_care/UI/ReUseAble/toast_message.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class SearchingDevicesCubit extends Cubit<SearchingDevicesState> {
 final SearchingDevicesInitialParams initialParams;
 final SearchingDevicesNavigator navigator;
 final SearchForDevicesUseCase searchForDevicesUseCase;
 final DeviceStore deviceStore;
 final BluetoothDeviceStore bluetoothDeviceStore;
 SearchingDevicesCubit(
     this.initialParams,
     this.navigator,
     this.searchForDevicesUseCase,
     this.deviceStore,
     this.bluetoothDeviceStore
     ) : super(SearchingDevicesState.initial(initialParams: initialParams));

void onInit(SearchingDevicesInitialParams initialParams) => emit(state.copyWith());

 final BleController bleController = Get.put(BleController());

  void moveToNextScreen(BluetoothDevice device) {



    // navigator.openDevicePairingPage(DevicePairingInitialParams());
  }

  void searchForDevices() {
    searchForDevicesUseCase.execute().then(
            (value) => value.fold(
                    (l) {
                      ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
                    },
                    (r) {
                      emit(state.copyWith(devices: r));
                      ToastMessage().showMessage('Got devices', ColorsConstants.successToastColor);
                    }
            )
    );
  }

  void setValueToDeviceStore(BluetoothDeviceInfo device) {
    deviceStore.setDevice(device);

    // bleController.connectToDevice(BluetoothDevice(remoteId: device.id??''));

    // navigator.openDevicePairingPage(DevicePairingInitialParams());
  }

   getDevices() async {
    debugPrint('get Devices');
    emit(state.copyWith(isLoading: true));
    try{
      await bleController.scanDevices();
      Stream<List<ScanResult>> devices = bleController.scanResults;
      // emit(state.copyWith(isLoading: false,bluetoothDevices: devices));
    }catch(e){
      ToastMessage().showMessage(e.toString(), ColorsConstants.failureToastColor);
    }
  }

 void startListeningToScanResults() {
    // List<ScanResult> scanResults = state.bluetoothDevices;
    bleController.scanResults.listen((List<ScanResult> results) {
     // Update the list whenever the stream emits new results
     // scanResults = results;
     // emit(state.copyWith(scanResults: results));
     // You can perform any actions here, like updating UI
   });
 }

  // void setBluetoothDevice(BluetoothDevice device) {
  //   bluetoothDeviceStore.setDevice(device);
  // }

}
