import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuddle_care/Data/Model/user_model.dart';
import 'package:cuddle_care/Domain/Entity/profile_domain.dart';
import 'package:cuddle_care/Domain/Failure/check_if_logged_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/get_profile_data_failure.dart';
import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:cuddle_care/Domain/Failure/upload_image_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:cuddle_care/Service/Firebase/firebase_data_service.dart';
import 'package:cuddle_care/Service/Firebase/firebase_service.dart';
import 'package:cuddle_care/Service/Shared%20Preference%20Service/shared_preference_service.dart';
import 'package:dartz/dartz.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuthService service;
  final FirebaseDataService firebaseDataService;
  final SharedPreferenceService sharedPreferenceService;
  FirebaseUserRepository(this.service, this.firebaseDataService, this.sharedPreferenceService);
  
  @override
  Future<Either<SignUpUserFailure, String>> signUpUser(String email, String password, String name , String phone ) {
    // TODO: implement signUpUser
    return service.signUpWithEmail(email , password).then(
            (value) => value.fold(
                    (l) => left(SignUpUserFailure( l.error )),
                    (r) {
                      return firebaseDataService.insertUser(email, r,name).then(
                              (value) => value.fold(
                                      (l) => left(SignUpUserFailure(l.error)),
                                      (r) {
                                        sharedPreferenceService.setLogged();
                                        return right(r);
                                      }
                              )
                      );
                    }
            )
    );
  }

  @override
  Future<Either<GoogleSignUpFailure, String>> googleSignUp() {
    // TODO: implement googleSignUp
    return service.signInWithGoogle().then(
            (value) => value.fold(
                    (l) => left(GoogleSignUpFailure(l.error)),
                    (user) {

                      if( user != null ){
                        return firebaseDataService.insertUser(user.user?.email??'', user.user?.uid??'', user.user?.displayName??'').then(
                                (value) => value.fold(
                                        (l) => left(GoogleSignUpFailure(l.error)),
                                        (r) {
                                          sharedPreferenceService.setLogged();
                                          return right(user.user?.uid??'');
                                        }
                                )
                        );
                      }

                      return right('');


                    }
            )
    );
  }

  @override
  Future<Either<SignInFailure, String>> signIn(String email, String password) {
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

  @override
  Future<Either<GetProfileDataFailure, ProfileDomain>> getProfileData(String id) async {
    // TODO: implement getProfileData

    return firebaseDataService.getUserModelById(id).then(
            (value) => value.fold(
                    (l) => left( GetProfileDataFailure(l.error)),
                    (r) {

                      if( r != null ){
                        return right(r.toDomain());
                      }
                      else{
                        return right(const ProfileDomain.empty());
                      }

                    }
            )
    );

    // return right(
    //     ProfileDomain(
    //         email: 'hamzasardar954@gmail.com',
    //         name: 'Hamza',
    //         image: ''
    //     )
    // );
  }

  @override
  Future<Either<CheckIfLoggedInFailure, bool>> checkIfLoggedIn() async {
    // TODO: implement checkIfLoggedIn
    return sharedPreferenceService.checkIfLoggedIn();
  }






}