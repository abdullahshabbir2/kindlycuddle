
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';

class SignUpState {
  final String emailValidator;
  final bool emailValidated;
  final String passwordValidator;
  final bool passwordValidated;
  final bool showPassword;
  final int strengthLevel;
  final bool showStrength;
  SignUpState({
    required this.emailValidator,
    required this.emailValidated,
    required this.passwordValidator,
    required this.passwordValidated,
    required this.showPassword,
    required this.strengthLevel,
    required this.showStrength
});

  factory SignUpState.initial({required SignUpInitialParams initialParams}) =>
      SignUpState(
        emailValidated: false,
        emailValidator: '',
        passwordValidator: '',
        passwordValidated: false,
        showPassword: false,
        strengthLevel: 0,
        showStrength: false
  );

  SignUpState copyWith({
    String? emailValidator,
    bool? emailValidated,
    String? passwordValidator,
    bool? passwordValidated,
    bool? showPassword,
    int? strengthLevel,
    bool? showStrength
}) =>
      SignUpState(
        emailValidator: emailValidator ?? this.emailValidator,
        emailValidated: emailValidated ?? this.emailValidated,
        passwordValidator: passwordValidator ?? this.passwordValidator,
        passwordValidated: passwordValidated ?? this.passwordValidated,
        showPassword: showPassword ?? this.showPassword,
        strengthLevel: strengthLevel ?? this.strengthLevel,
        showStrength: showStrength ?? this.showStrength
      );
}