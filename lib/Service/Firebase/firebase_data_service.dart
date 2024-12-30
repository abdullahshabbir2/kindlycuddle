import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuddle_care/Data/Model/user_model.dart';
import 'package:cuddle_care/Domain/Failure/get_profile_data_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class FirebaseDataService{
  Future<Either<SignUpUserFailure, String>> insertUser(String email, String id , String name) async {

    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      // Insert data into Firestore

      // String id = DateTime.now().microsecondsSinceEpoch.toString();


      debugPrint(name);

      await usersCollection.doc(id).set({
        'email': email,
        'id': id,
        'image': '',
        'name':name
      });
      print('User data inserted successfully');

      return right(id);

    } catch (e) {
      print('Error inserting data: $e');
      return left(SignUpUserFailure( e.toString()));
    }

  }

  Future<void> fetchUserData(String id) async {
    // Create a reference to the 'users' collection
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      // Get the document with the specified ID
      DocumentSnapshot documentSnapshot = await usersCollection.doc(id).get();

      if (documentSnapshot.exists) {
        // Extract data from the document
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        String email = data['email'] ?? '';
        String image = data['image'] ?? '';

        print('Email: $email');
        print('Image: $image');
      } else {
        print('No user found with ID: $id');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future< Either< GetProfileDataFailure ,  UserModel? > > getUserModelById(String id) async {
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance.collection('users').doc(id).get();

      if (document.exists) {
        return right( UserModel.fromMap(document.data() as Map<String, dynamic>) ) ;
      } else {
        print("User not found.");
        return right( null );
      }
    } catch (e) {
      print("Error fetching user: $e");
      return left( GetProfileDataFailure( e.toString()) );
    }
  }


}

