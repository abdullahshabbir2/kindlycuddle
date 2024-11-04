import 'package:cuddle_care/Domain/Failure/upload_image_failure.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UploadImageUseCase{
  final UserRepository repository;
  UploadImageUseCase(this.repository);


  Future<Either< UploadImageFailure , String >> execute(String imgPath){
    return repository.uploadImage(imgPath);
  }

}