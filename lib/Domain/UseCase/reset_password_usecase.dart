import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase{
  final UserRepository repository;
  ResetPasswordUseCase(this.repository);

  Future<Either< ResetPasswordFailure , bool >> execute(String email){
    return repository.resetPassword(email);
  }

}