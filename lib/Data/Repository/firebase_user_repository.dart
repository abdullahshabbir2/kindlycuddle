import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:cuddle_care/Service/Firebase/firebase_service.dart';
import 'package:dartz/dartz.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuthService service;
  FirebaseUserRepository(this.service);
  
  @override
  Future<Either<SignUpUserFailure, bool>> signUpUser(String email, String password) {
    // TODO: implement signUpUser
    return service.signUpWithEmail(email , password);
  }

  @override
  Future<Either<GoogleSignUpFailure, bool>> googleSignUp() {
    // TODO: implement googleSignUp
    return service.signInWithGoogle();
  }

  @override
  Future<Either<SignInFailure, bool>> signIn(String email, String password) {
    // TODO: implement signIn
    return service.signIn(email,password);
  }

  @override
  Future<Either<ResetPasswordFailure, bool>> resetPassword(String email) {
    // TODO: implement resetPassword
    return service.resetPassword(email);
  }
  
}