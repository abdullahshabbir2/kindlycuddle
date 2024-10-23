
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';

class SignUpState {
  final String emailValidator;
  final bool emailValidated;
  final String passwordValidator;
  final bool passwordValidated;
  final bool showPassword;
  final int strengthLevel;
  final bool showStrength;
  final String email;
  final String password;
  final String userName;
  SignUpState({
    required this.emailValidator,
    required this.emailValidated,
    required this.passwordValidator,
    required this.passwordValidated,
    required this.showPassword,
    required this.strengthLevel,
    required this.showStrength,
    required this.email,
    required this.password,
    required this.userName
});

  factory SignUpState.initial({required SignUpInitialParams initialParams}) =>
      SignUpState(
        emailValidated: false,
        emailValidator: '',
        passwordValidator: '',
        passwordValidated: false,
        showPassword: false,
        strengthLevel: 0,
        showStrength: false,
        email: '',
        password: '',
        userName: ''
  );

  SignUpState copyWith({
    String? emailValidator,
    bool? emailValidated,
    String? passwordValidator,
    bool? passwordValidated,
    bool? showPassword,
    int? strengthLevel,
    bool? showStrength,
    String? email,
    String? password,
    String? userName
}) =>
      SignUpState(
        emailValidator: emailValidator ?? this.emailValidator,
        emailValidated: emailValidated ?? this.emailValidated,
        passwordValidator: passwordValidator ?? this.passwordValidator,
        passwordValidated: passwordValidated ?? this.passwordValidated,
        showPassword: showPassword ?? this.showPassword,
        strengthLevel: strengthLevel ?? this.strengthLevel,
        showStrength: showStrength ?? this.showStrength,
        email: email ?? this.email,
        password: password ?? this.password,
        userName: userName ?? this.userName
      );
}