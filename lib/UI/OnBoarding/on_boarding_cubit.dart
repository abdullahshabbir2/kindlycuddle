import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Domain/UseCase/check_if_logged_in.dart';
import 'package:cuddle_care/UI/ReUseAble/toast_message.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_initial_params.dart';
import 'on_boarding_navigator.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
 final OnBoardingInitialParams initialParams;
 final OnBoardingNavigator navigator;
 final CheckIfLoggedIn checkIfLoggedIn;
 OnBoardingCubit(
     this.initialParams,
     this.navigator,
     this.checkIfLoggedIn
     ) : super(OnBoardingState.initial(initialParams: initialParams));


void onInit(OnBoardingInitialParams initialParams) => emit(state.copyWith());


  void moveToNextScreen() {


    checkIfLoggedIn.execute().then(
            (value) => value.fold(
                (l) {
              ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
            },
                (isLogged) {
              if(!isLogged){
                // navigator.openOnBoardingPage(OnBoardingInitialParams());
                navigator.openSignUpPage(SignUpInitialParams());
              }
              else{
                navigator.openSignInPage(SignInInitialParams());
              }
            }
        )
    );


  }
}
