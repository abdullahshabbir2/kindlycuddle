import 'package:flutter_bloc/flutter_bloc.dart';
import 'bluetooth_permission_initial_params.dart';
import 'bluetooth_permission_navigator.dart';
import 'bluetooth_permission_state.dart';

class BluetoothPermissionCubit extends Cubit<BluetoothPermissionState> {
 final BluetoothPermissionInitialParams initialParams;
 final BluetoothPermissionNavigator navigator;
 BluetoothPermissionCubit(
     this.initialParams,
     this.navigator
     ) : super(BluetoothPermissionState.initial(initialParams: initialParams));

void onInit(BluetoothPermissionInitialParams initialParams) => emit(state.copyWith());

}
