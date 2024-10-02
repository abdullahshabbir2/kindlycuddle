import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../User Guide 5/user_guide5_initial_params.dart';

class UserGuide4Cubit extends Cubit<UserGuide4State> {
 final UserGuide4InitialParams initialParams;
 final UserGuide4Navigator navigator;
 UserGuide4Cubit(
     this.initialParams,
     this.navigator
     ) : super(UserGuide4State.initial(initialParams: initialParams));

void onInit(UserGuide4InitialParams initialParams) => emit(state.copyWith());

 void moveToUserGuide5(){
  navigator.openUserGuide5Page(UserGuide5InitialParams());
 }

}
