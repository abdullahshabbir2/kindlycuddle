import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_state.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_initial_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserGuide3Cubit extends Cubit<UserGuide3State> {
 final UserGuide3InitialParams initialParams;
 final UserGuide3Navigator navigator;
 UserGuide3Cubit(
     this.initialParams,
     this.navigator
     ) : super(UserGuide3State.initial(initialParams: initialParams));


void onInit(UserGuide3InitialParams initialParams) => emit(state.copyWith());

 void moveToUserGuide4(){
  navigator.openUserGuide4Page(UserGuide4InitialParams());
 }

}
