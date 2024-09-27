import 'package:cuddle_care/UI/Bluetooth/Device%20Connected%20Successfully/device_connected_successfully_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'device_pairing_initial_params.dart';
import 'device_pairing_navigator.dart';
import 'device_pairing_state.dart';

class DevicePairingCubit extends Cubit<DevicePairingState> {
 final DevicePairingInitialParams initialParams;
 final DevicePairingNavigator navigator;
 DevicePairingCubit(
     this.initialParams,
     this.navigator
     ) : super(DevicePairingState.initial(initialParams: initialParams));


void onInit(DevicePairingInitialParams initialParams) => emit(state.copyWith());

  void moveToNextScreen() {
    navigator.openDeviceConnectedSuccessfullyPage(DeviceConnectedSuccessfullyInitialParams());
  }

}
