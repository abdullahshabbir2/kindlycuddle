import 'package:cuddle_care/Data/Repository/mock_user_repository.dart';
import 'package:cuddle_care/Domain/Entity/profile_domain.dart';
import 'package:cuddle_care/Domain/Failure/get_profile_data_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfileDataUseCase{
  final UserRepository repository;
  GetProfileDataUseCase(this.repository);


  Future<Either< GetProfileDataFailure , ProfileDomain >> getProfileData(String id){
    return repository.getProfileData(id);
  }

}

