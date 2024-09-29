
import 'package:cuddle_care/UI/Session%20Options/session_options_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Home_initial_params.dart';
import 'home_navigator.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
 final HomeInitialParams initialParams;
 final HomeNavigator navigator;
 HomeCubit(
     this.initialParams,
     this.navigator
     ) : super(HomeState.initial(initialParams: initialParams));

void onInit(HomeInitialParams initialParams) => emit(state.copyWith());

  void setIndex(int index) {
    emit(state.copyWith(index:index));
  }

  void moveToSessionOptions() {
    navigator.openSessionOptionsPage(SessionOptionsInitialParams());
  }

}
