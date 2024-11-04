import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:cuddle_care/Domain/Failure/upload_image_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:cuddle_care/Service/Firebase/firebase_data_service.dart';
import 'package:cuddle_care/Service/Firebase/firebase_service.dart';
import 'package:dartz/dartz.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuthService service;
  final FirebaseDataService firebaseDataService;
  FirebaseUserRepository(this.service, this.firebaseDataService);
  
  @override
  Future<Either<SignUpUserFailure, bool>> signUpUser(String email, String password) {
    // TODO: implement signUpUser
    return service.signUpWithEmail(email , password).then(
            (value) => value.fold(
                    (l) => left(SignUpUserFailure( l.error )),
                    (r) {
                      return firebaseDataService.insertUser(email, r);
                    }
            )
    );
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

  @override
  Future<Either<UploadImageFailure, String>> uploadImage(String imgPath) {
    // TODO: implement uploadImage
    return service.uploadImage(imgPath);
  }
  
}