import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase{
  final UserRepository repository;
  SignInUseCase(this.repository);

  Future<Either< SignInFailure , String >> execute(String email , String password){
    return repository.signIn(email , password);
  }

}

