import 'package:cuddle_care/Domain/Failure/google_signup_failure.dart';
import 'package:cuddle_care/Domain/Failure/reset_password_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_in_failure.dart';
import 'package:cuddle_care/Domain/Failure/sign_up_user_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<User?>
  Future<Either< GoogleSignUpFailure , bool >> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return right(false);
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
      // return userCredential.user;
      return right(true);
    } on FirebaseAuthException catch (e) {
      print('Error during Google Sign-In: ${e.message}');
      return left(GoogleSignUpFailure(e.toString()));
    }
  }

  Future<Either<SignUpUserFailure, bool>> signUpWithEmail(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if(user != null && !user.emailVerified ){
        await user.sendEmailVerification();
        return right(true);
      }
      return right(false);
    }catch(e){
      return left(SignUpUserFailure(e.toString()));
    }
  }

  Future<Either<SignInFailure, bool>> signIn(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);



      return right(true);
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


}