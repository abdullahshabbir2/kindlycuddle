
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_navigator.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
 final SignInInitialParams initialParams;
 final SignInNavigator navigator;
 SignInCubit(
     this.initialParams,
     this.navigator
     ) : super(SignInState.initial(initialParams: initialParams));

void onInit(SignInInitialParams initialParams) => emit(state.copyWith());

  emailValidator(value) {

  debugPrint(value);

 if (value == null || value.isEmpty) {
  // debugPrint('is Empty');
   emit(state.copyWith(emailValidator:'Please enter your email'));
   emit(state.copyWith(emailValidated:false));
   return 'Please enter your email';
 // return 'Please enter your email';
 } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
   emit(state.copyWith(emailValidator:'Please enter valid email', emailValidated: false));

   return 'Please enter your email';
 // return 'Please enter a valid email';
 }else{
   emit(state.copyWith(emailValidator: '',emailValidated: true));
   return '';
 }
 // return '';
 }

 passwordValidator(value) {
     if (value == null || value.isEmpty) {
       emit(state.copyWith(passwordValidator: 'Please enter your password',passwordValidated:false ));
       return 'Please enter your password';
       // return 'Please enter your password';
     } else if (value.length < 6) {
       emit(state.copyWith(passwordValidator: 'Password must be at least 6 characters long',passwordValidated: false));
       return 'Password must be at least 6 characters long';
       // return 'Password must be at least 6 characters long';
     }
     else{
       emit(state.copyWith(passwordValidator: '',passwordValidated: true));
       return '';
     }
     // return null;
   }

  void reverseObsecurity() {
   emit(state.copyWith(showPassword: !(state.showPassword)));
  }

  void SignIn() {
    if(state.emailValidated && state.passwordValidated){
      navigator.openSignUpPage(SignUpInitialParams());
    }

  }

  void moveToSignUp() {
    navigator.openSignUpPage(SignUpInitialParams());
  }

}
