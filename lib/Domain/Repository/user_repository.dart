import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/upload_image_failure.dart';
import 'package:dartz/dartz.dart';

import '../Failure/sign_up_user_failure.dart';

abstract class UserRepository{
  Future<Either< SignUpUserFailure , bool >> signUpUser(String email, String password);

  Future<Either<GoogleSignUpFailure, bool>> googleSignUp();

  Future<Either<SignInFailure, bool>> signIn(String email, String password);

  Future<Either<ResetPasswordFailure, bool>> resetPassword(String email);

  Future<Either<UploadImageFailure, String>> uploadImage(String imgPath);
}