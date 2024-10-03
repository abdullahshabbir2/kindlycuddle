import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Profile/Profile_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserGuide5Cubit extends Cubit<UserGuide5State> {
 final UserGuide5InitialParams initialParams;
 final UserGuide5Navigator navigator;
 UserGuide5Cubit(
     this.initialParams,
     this.navigator
     ) : super(UserGuide5State.initial(initialParams: initialParams));


void onInit(UserGuide5InitialParams initialParams) => emit(state.copyWith());

  void moveToNextScreen() {
    navigator.openHomePage(HomeInitialParams());
  }

}
