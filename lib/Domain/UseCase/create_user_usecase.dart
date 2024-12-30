import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class CreateUserUseCase{
  final UserRepository repository;
  CreateUserUseCase(this.repository);

  Future<Either<SignUpUserFailure , String>> execute(String email, String password , String name){
    return repository.signUpUser(email, password, name , '').then(
            (value) => value.fold(
                    (l) => left(l),
                    (r) => right(r)
            )
    );
  }

}