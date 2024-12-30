import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Domain/UseCase/check_if_logged_in.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_initial_params.dart';
import 'package:cuddle_care/UI/ReUseAble/toast_message.dart';
import 'package:cuddle_care/UI/Splash/Splash_initial_params.dart';
import 'package:cuddle_care/UI/Splash/splash_navigator.dart';
import 'package:cuddle_care/UI/Splash/splash_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
 final SplashInitialParams initialParams;
 final SplashNavigator navigator;
 SplashCubit(
     this.initialParams,
     this.navigator,
     ) : super(SplashState.initial(initialParams: initialParams));

void onInit(SplashInitialParams initialParams) => emit(state.copyWith());

void moveToNextScreen(){
  navigator.openOnBoardingPage(OnBoardingInitialParams());
}



}
