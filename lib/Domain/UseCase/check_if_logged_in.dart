import 'package:cuddle_care/Domain/Failure/check_if_logged_in_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class CheckIfLoggedIn{
  final UserRepository userRepository;
  CheckIfLoggedIn(this.userRepository);


  Future<Either<  CheckIfLoggedInFailure , bool >> execute(){
    return userRepository.checkIfLoggedIn();
  }

}