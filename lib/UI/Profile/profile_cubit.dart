import 'package:cuddle_care/UI/Profile/profile_navigator.dart';
import 'package:cuddle_care/UI/Profile/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Profile_initial_params.dart';

class ProfileCubit extends Cubit<ProfileState> {
 final ProfileInitialParams initialParams;
 final ProfileNavigator navigator;
 ProfileCubit(
     this.initialParams,
     this.navigator
     ) : super(ProfileState.initial(initialParams: initialParams));


void onInit(ProfileInitialParams initialParams) => emit(state.copyWith());

  void setButtonValue(bool value) {
    emit(state.copyWith(isButtonOn: value));
  }

}
