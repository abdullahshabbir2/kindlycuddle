import 'package:cuddle_care/Domain/Entity/profile_domain.dart';
import 'package:cuddle_care/Domain/Failure/check_if_logged_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/get_profile_data_failure.dart';
import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:cuddle_care/Domain/Failure/upload_image_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class MockUserRepository implements UserRepository {
  // final FirebaseAuthService service;
  // final FirebaseDataService firebaseDataService;
  MockUserRepository(
      // this.service, this.firebaseDataService
      );

  @override
  Future<Either<GetProfileDataFailure, ProfileDomain>> getProfileData(String id) async {
    // TODO: implement getProfileData
    return right(
      ProfileDomain(
        email: 'hamzasardar954@gmail.com',
        name: 'Hamza',
        image: ''
      )
    );
  }

  @override
  Future<Either<GoogleSignUpFailure, String >> googleSignUp() {
    // TODO: implement googleSignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<ResetPasswordFailure, bool>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<SignInFailure, String>> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<SignUpUserFailure, String >> signUpUser(String email, String password , String name , String phone) {
    // TODO: implement signUpUser
    throw UnimplementedError();
  }

  @override
  Future<Either<UploadImageFailure, String>> uploadImage(String imgPath) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

  @override
  Future<Either<CheckIfLoggedInFailure, bool>> checkIfLoggedIn() {
    // TODO: implement checkIfLoggedIn
    throw UnimplementedError();
  }

}