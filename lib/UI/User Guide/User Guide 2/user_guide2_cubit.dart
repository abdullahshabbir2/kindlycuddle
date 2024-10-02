import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_state.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_initial_params.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserGuide2Cubit extends Cubit<UserGuide2State> {
 final UserGuide2InitialParams initialParams;
 final UserGuide2Navigator navigator;
 UserGuide2Cubit(
     this.initialParams,
     this.navigator
     ) : super(UserGuide2State.initial(initialParams: initialParams));




void onInit(UserGuide2InitialParams initialParams) => emit(state.copyWith());

 void moveToUserGuide3(){
  navigator.openUserGuide3Page(UserGuide3InitialParams());
 }

}
