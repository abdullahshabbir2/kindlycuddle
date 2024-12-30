import 'package:cuddle_care/Domain/Entity/profile_domain.dart';
import 'package:cuddle_care/Domain/Failure/check_if_logged_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/get_profile_data_failure.dart';
import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/upload_image_failure.dart';
import 'package:dartz/dartz.dart';

import '../Failure/sign_up_user_failure.dart';

abstract class UserRepository{
  Future<Either< SignUpUserFailure , String >> signUpUser(String email, String password , String name , String phone);

  Future<Either<GoogleSignUpFailure, String>> googleSignUp();

  Future<Either<SignInFailure, String>> signIn(String email, String password);

  Future<Either<ResetPasswordFailure, bool>> resetPassword(String email);

  Future<Either<UploadImageFailure, String>> uploadImage(String imgPath);

  Future<Either<GetProfileDataFailure, ProfileDomain>> getProfileData(String id);

  Future<Either<CheckIfLoggedInFailure, bool>> checkIfLoggedIn();



}


