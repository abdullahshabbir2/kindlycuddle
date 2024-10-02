import 'package:cuddle_care/UI/User%20Guide/User%20Guide%201/user_guide1_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%201/user_guide1_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%201/user_guide1_state.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_initial_params.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserGuide1Cubit extends Cubit<UserGuide1State> {
 final UserGuide1InitialParams initialParams;
 final UserGuide1Navigator navigator;
 UserGuide1Cubit(
     this.initialParams,
     this.navigator
     ) : super(UserGuide1State.initial(initialParams: initialParams));

void onInit(UserGuide1InitialParams initialParams) => emit(state.copyWith());

 void moveToUserGuide2(){
  navigator.openUserGuide2Page(UserGuide2InitialParams());
 }

}
