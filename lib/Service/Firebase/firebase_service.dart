import 'dart:io';

import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:cuddle_care/Domain/Failure/upload_image_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path/path.dart' as path; // For extracting the file name
class FirebaseAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<User?>
  Future<Either< GoogleSignUpFailure , UserCredential? >> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return right(null);
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google user credentials
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      debugPrint(userCredential.user?.email);
      debugPrint(userCredential.user?.displayName);
      debugPrint(userCredential.user?.phoneNumber ?? '');
      debugPrint(userCredential.user?.photoURL);

      // return userCredential.user;
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      print('Error during Google Sign-In: ${e.message}');
      return left(GoogleSignUpFailure(e.toString()));
    }
  }

  Future<Either<SignUpUserFailure, String>> signUpWithEmail(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if(user != null && !user.emailVerified ){
        await user.sendEmailVerification();

        debugPrint(user.uid);
        return right(user.uid);
      }
      else{
        return right('');
      }

    }catch(e){
      return left(SignUpUserFailure(e.toString()));
    }
  }

  Future<Either<SignInFailure, String>> signIn(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      debugPrint(userCredential.user?.uid);

      return right(userCredential.user?.uid ?? '');
    }catch(e){
      return left(SignInFailure(e.toString()));
    }
  }

  Future<Either<ResetPasswordFailure, bool>> resetPassword(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return right(true);
    }catch(e){
      return left(ResetPasswordFailure(e.toString()));
    }
  }

  Future<Either<UploadImageFailure, String>> uploadImage(String imgPath) async {
    try{
      // final ImagePicker picker = ImagePicker();
      // final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      // if (image == null) {
      //   print('No image selected.');
      //   return;
      // }

      // Get the file name
      // String fileName = path.;

      // Create a reference to Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageRef = storage.ref().child('uploads/$imgPath');

      // Upload the file
      UploadTask uploadTask = storageRef.putFile(File(imgPath));

      // Wait for the upload to complete and get the download URL
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      print('Image uploaded successfully. Download URL: $downloadURL');

      return right(downloadURL);

    }catch(e){
      return left(UploadImageFailure(e.toString()));
    }
  }


}