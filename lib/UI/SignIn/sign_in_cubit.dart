
import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Domain/UseCase/google_signUp_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/reset_password_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/sign_in_usecase.dart';
import 'package:cuddle_care/UI/Bluetooth/Bluetooth%20Permissions/bluetooth_permission_initial_params.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/home_page.dart';
import 'package:cuddle_care/UI/ReUseAble/toast_message.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_navigator.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_state.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
 final SignInInitialParams initialParams;
 final SignInNavigator navigator;
 final SignInUseCase signInUseCase;
 final ResetPasswordUseCase resetPasswordUseCase;
 final GoogleSignUpUseCase googleSignUpUseCase;
 SignInCubit(
     this.initialParams,
     this.navigator,
     this.signInUseCase,
     this.resetPasswordUseCase,
     this.googleSignUpUseCase,
     ) : super(SignInState.initial(initialParams: initialParams));

void onInit(SignInInitialParams initialParams) => emit(state.copyWith());

  emailValidator(value) {

  debugPrint(value);

  emit(state.copyWith(email: value as String));

 if (value == null || value.isEmpty) {
  // debugPrint('is Empty');
   emit(state.copyWith(emailValidator:'Please enter your email'));
   emit(state.copyWith(emailValidated:false));
   // return 'Please enter your email';
   return false;
 // return 'Please enter your email';
 } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
   emit(state.copyWith(emailValidator:'Please enter valid email', emailValidated: false));

   // return 'Please enter your email';
 // return 'Please enter a valid email';
   return false;
 }else{
   emit(state.copyWith(emailValidator: '',emailValidated: true));
   // return '';
   return true;
 }
 // return '';
 }

 passwordValidator(String value) {

    emit(state.copyWith(password: value));

     if (value == null || value.isEmpty) {
       emit(state.copyWith(passwordValidator: 'Please enter your password',passwordValidated:false ));
       // return 'Please enter your password';
       return false;
       // return 'Please enter your password';
     } else if (value.length < 6) {
       emit(state.copyWith(passwordValidator: 'Password must be at least 6 characters long',passwordValidated: false));
       // return 'Password must be at least 6 characters long';
       return false;
       // return 'Password must be at least 6 characters long';
     }
     else{
       emit(state.copyWith(passwordValidator: '',passwordValidated: true));
       // return '';
       return true;
     }
     // return null;
   }

  void reverseObsecurity() {
   emit(state.copyWith(showPassword: !(state.showPassword)));
  }

  void SignIn(BuildContext context) {

    if(emailValidator(state.email) && passwordValidator(state.password)){

      signInUseCase.execute(state.email, state.password).then(
              (value) => value.fold(
                      (l) {
                        ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
                      },
                      (r) {
                        ToastMessage().showMessage('Sign In Success', ColorsConstants.successToastColor);
                        // navigator.openSignUpPage(SignUpInitialParams());
                        // navigator.openBluetoothPermissionPage(BluetoothPermissionInitialParams());

                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(cubit: getIt(param1: HomeInitialParams())) ));

                      }
              )
      );

    }

    // if(state.emailValidated && state.passwordValidated){
    //   navigator.openSignUpPage(SignUpInitialParams());
    // }

  }

  void moveToSignUp() {
    navigator.openSignUpPage(SignUpInitialParams());
  }

  void setEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void setPassword(password) {
    emit(state.copyWith(password: password));
  }

 void resetPassword() {
   resetPasswordUseCase.execute(state.email).then(
           (value) => value.fold(
               (l){
             ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
           },
               (r) {
             ToastMessage().showMessage('Check Password Update Email', ColorsConstants.successToastColor);
           }
       )
   );
 }

 void googleSignUp(BuildContext context) {
   googleSignUpUseCase.execute().then(
           (value) => value.fold(
               (l) {
             ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
           },
               (r) {
             ToastMessage().showMessage('Sign Up Suceesful', ColorsConstants.successToastColor);
             // navigator.openBluetoothPermissionPage(BluetoothPermissionInitialParams());

             Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(cubit: getIt(param1: HomeInitialParams())) ));

               }
       )
   );
 }

}
