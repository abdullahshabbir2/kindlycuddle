import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';

class SignInState {
  final bool showPassword;
  SignInState({
    required this.showPassword
});

  factory SignInState.initial({required SignInInitialParams initialParams}) =>
      SignInState(
        showPassword: false
  );

  SignInState copyWith({
    bool? showPassword
  }) =>
      SignInState(
        showPassword: showPassword ?? this.showPassword
      );
}