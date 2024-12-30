import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class GoogleSignUpUseCase{
  final UserRepository repository;
  GoogleSignUpUseCase(this.repository);

  Future<Either< GoogleSignUpFailure , String >> execute(){
    return repository.googleSignUp();
  }

}