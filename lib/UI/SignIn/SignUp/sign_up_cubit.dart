import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Domain/UseCase/create_user_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/google_signUp_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/reset_password_usecase.dart';
import 'package:cuddle_care/UI/Bluetooth/Bluetooth%20Permissions/bluetooth_permission_initial_params.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/home_page.dart';
import 'package:cuddle_care/UI/ReUseAble/toast_message.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_navigator.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_state.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
 final SignUpInitialParams initialParams;
 final SignUpNavigator navigator;
 final CreateUserUseCase createUserUseCase;
 final GoogleSignUpUseCase googleSignUpUseCase;
 final ResetPasswordUseCase resetPasswordUseCase;
 SignUpCubit(
     this.initialParams,
     this.navigator,
     this.createUserUseCase,
     this.googleSignUpUseCase,
     this.resetPasswordUseCase
     ) : super(SignUpState.initial(initialParams: initialParams));

void onInit(SignUpInitialParams initialParams) => emit(state.copyWith());

 emailValidator(value) {

   debugPrint('email:'+value);

   emit(state.copyWith(email: value as String));

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
   emit(state.copyWith(password: value as String));
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

 void checkPasswordStrength(String password) {

   emit(state.copyWith(showStrength: true));

   int strength = 0;

   if(state.strengthLevel < 3) {
     if (password.length >= 6) strength++;
     if (password.contains(RegExp(r'[A-Z]'))) strength++;
     if (password.contains(RegExp(r'[0-9]'))) strength++;
     if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

     emit(state.copyWith(strengthLevel: strength,password: password));

   }

 }

  void signUp() {
   //  emailValidator(state.email);
   // passwordValidator(state.password);

   createUserUseCase.execute(state.email, state.password, state.userName).then(
           (value) => value.fold(
                   (l) {
                     debugPrint(l.error);
                     ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
                   },
                   (signedUp) {

                     if(signedUp){
                       ToastMessage().showMessage('Sign Up Successful Check Verification Email', ColorsConstants.successToastColor);
                       navigator.openBluetoothPermissionPage(BluetoothPermissionInitialParams());
                     }else{
                       ToastMessage().showMessage('Cannot Sign Up', ColorsConstants.failureToastColor);
                     }

                   }
           )
   );

  }

  void moveToSignIn() {
   navigator.openSignInPage(SignInInitialParams());
  }

  void setUserName(String value) {
   emit(state.copyWith(userName: value));
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

}
