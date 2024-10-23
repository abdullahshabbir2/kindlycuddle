import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';

class SignInState {
  final bool showPassword;
  final String emailValidator;
  final String passwordValidator;
  final bool emailValidated;
  final bool passwordValidated;
  final String email;
  final String password;
  SignInState({
    required this.showPassword,
    required this.emailValidator,
    required this.passwordValidator,
    required this.emailValidated,
    required this.passwordValidated,
    required this.email,
    required this.password
});

  factory SignInState.initial({required SignInInitialParams initialParams}) =>
      SignInState(
        showPassword: false,
        emailValidator: '',
        passwordValidator: '',
        emailValidated: false,
        passwordValidated: false,
        email: '',
        password: ''
  );

  SignInState copyWith({
    bool? showPassword,
    String? emailValidator,
    String? passwordValidator,
    bool? emailValidated,
    bool? passwordValidated,
    String? email,
    String? password
  }) =>
      SignInState(
        showPassword: showPassword ?? this.showPassword,
        emailValidator: emailValidator ?? this.emailValidator,
        passwordValidator: passwordValidator ?? this.passwordValidator,
        emailValidated: emailValidated ?? this.emailValidated,
        passwordValidated: passwordValidated ?? this.passwordValidated,
        email: email ?? this.email,
        password: password ?? this.password
      );
}