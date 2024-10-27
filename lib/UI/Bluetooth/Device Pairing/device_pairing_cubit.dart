import 'package:cuddle_care/Domain/Store/device_info_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'device_pairing_initial_params.dart';
import 'device_pairing_navigator.dart';
import 'device_pairing_state.dart';

class DevicePairingCubit extends Cubit<DevicePairingState> {
 final DevicePairingInitialParams initialParams;
 final DevicePairingNavigator navigator;
 final DeviceStore store;
 DevicePairingCubit(
     this.initialParams,
     this.navigator,
     this.store
     ) : super(DevicePairingState.initial(initialParams: initialParams));


void onInit(DevicePairingInitialParams initialParams) => emit(state.copyWith(deviceInfo: store.state));

  void moveToNextScreen() {
    // navigator.openDeviceConnectedSuccessfullyPage(DeviceConnectedSuccessfullyInitialParams());
  }

}
