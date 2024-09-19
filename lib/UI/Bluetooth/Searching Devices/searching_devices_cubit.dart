import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchingDevicesCubit extends Cubit<SearchingDevicesState> {
 final SearchingDevicesInitialParams initialParams;
 final SearchingDevicesNavigator navigator;
 SearchingDevicesCubit(
     this.initialParams,
     this.navigator
     ) : super(SearchingDevicesState.initial(initialParams: initialParams));

void onInit(SearchingDevicesInitialParams initialParams) => emit(state.copyWith());

  void moveToNextScreen() {
    navigator.openDevicePairingPage(DevicePairingInitialParams());
  }

}
