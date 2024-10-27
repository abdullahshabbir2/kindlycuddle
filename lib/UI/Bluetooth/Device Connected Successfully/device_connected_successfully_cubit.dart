
import 'package:cuddle_care/Domain/Store/device_info_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'device_connected_successfully_initial_params.dart';
import 'device_connected_successfully_navigator.dart';
import 'device_connected_successfully_state.dart';

class DeviceConnectedSuccessfullyCubit extends Cubit<DeviceConnectedSuccessfullyState> {
 final DeviceConnectedSuccessfullyInitialParams initialParams;
 final DeviceConnectedSuccessfullyNavigator navigator;
 final DeviceStore store;
 DeviceConnectedSuccessfullyCubit(
     this.initialParams,
     this.navigator,
     this.store
     ) : super(DeviceConnectedSuccessfullyState.initial(initialParams: initialParams));



void onInit(DeviceConnectedSuccessfullyInitialParams initialParams) => emit(state.copyWith(device: store.state));

  void moveToNextScreen() {
    // navigator.openHomePage(HomeInitialParams());
  }

}
