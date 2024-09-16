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

 String emailValidator(value) {

  debugPrint(value);

 if (value == null || value.isEmpty) {
  // debugPrint('is Empty');
 return 'Please enter your email';
 } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
 return 'Please enter a valid email';
 }
 return '';
 }

 passwordValidator(value) {
     if (value == null || value.isEmpty) {
       return 'Please enter your password';
     } else if (value.length < 6) {
       return 'Password must be at least 6 characters long';
     }
     return null;
   }

  void reverseObsecurity() {
   emit(state.copyWith(showPassword: !(state.showPassword)));
  }

}
