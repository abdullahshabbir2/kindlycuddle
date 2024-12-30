import 'package:cuddle_care/Domain/Entity/profile_domain.dart';

class UserModel {
  final String? email;
  final String? id;
  final String? image;
  final String? name;

  UserModel({
    this.email,
    this.id,
    this.image,
    this.name,
  });

  // Factory constructor to create a UserModel from a map (Firestore document)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String?,
      id: map['id'] as String?,
      image: map['image'] as String?,
      name: map['name'] as String?,
    );
  }

  // Convert a UserModel to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'image': image,
      'name': name,
    };
  }

  ProfileDomain toDomain() => ProfileDomain(
      email: email,
      id: id ,
      name: name,
      image: image
  );
}
