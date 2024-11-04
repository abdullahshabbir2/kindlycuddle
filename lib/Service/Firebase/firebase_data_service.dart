import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:dartz/dartz.dart';

class FirebaseDataService{
  Future<Either<SignUpUserFailure, bool>> insertUser(String email, String id) async {

    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      // Insert data into Firestore

      // String id = DateTime.now().microsecondsSinceEpoch.toString();

      await usersCollection.doc(id).set({
        'email': email,
        'id': id,
        'image': '',
      });
      print('User data inserted successfully');

      return right(true);

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


}