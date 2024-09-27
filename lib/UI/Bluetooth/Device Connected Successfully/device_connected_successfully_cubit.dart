
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'device_connected_successfully_initial_params.dart';
import 'device_connected_successfully_navigator.dart';
import 'device_connected_successfully_state.dart';

class DeviceConnectedSuccessfullyCubit extends Cubit<DeviceConnectedSuccessfullyState> {
 final DeviceConnectedSuccessfullyInitialParams initialParams;
 final DeviceConnectedSuccessfullyNavigator navigator;
 DeviceConnectedSuccessfullyCubit(
     this.initialParams,
     this.navigator
     ) : super(DeviceConnectedSuccessfullyState.initial(initialParams: initialParams));



void onInit(DeviceConnectedSuccessfullyInitialParams initialParams) => emit(state.copyWith());

  void moveToNextScreen() {
    navigator.openHomePage(HomeInitialParams());
  }

}
