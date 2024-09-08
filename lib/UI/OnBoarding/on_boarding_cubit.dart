import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_initial_params.dart';
import 'on_boarding_navigator.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
 final OnBoardingInitialParams initialParams;
 final OnBoardingNavigator navigator;
 OnBoardingCubit(
     this.initialParams,
     this.navigator
     ) : super(OnBoardingState.initial(initialParams: initialParams));


void onInit(OnBoardingInitialParams initialParams) => emit(state.copyWith());

}
