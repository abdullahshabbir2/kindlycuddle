import 'package:bloc/bloc.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/home_cubit.dart';
import 'package:cuddle_care/UI/Home/home_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// **Google Sign-In**
  Future<void> googleSignUp(BuildContext context) async {
    emit(AuthLoading());
    try {
      print("Attempting Google Sign-In...");

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("Google Sign-In Canceled");
        emit(AuthFailure("Google Sign-In Canceled"));
        return;
      }

      print("Google user retrieved: ${googleUser.email}");

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User user = userCredential.user!;

      // ✅ Print user email here
      print("Google Sign-In Success! Email: ${user.email}");

      // Get an instance of HomeCubit, you may already have it provided in your app
      final homeCubit = getIt<HomeCubit>(param1: HomeInitialParams());

      // Navigate to the Home page and remove all previous routes
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            cubit: homeCubit, // Pass the HomeCubit to HomePage
          ),
        ),
        (Route<dynamic> route) => false, // This will remove all previous routes
      );

      emit(AuthSuccess(user));
    } catch (e) {
      print("Google Sign-In Error: $e");
      emit(AuthFailure("Google Sign-In Error: $e"));
    }
  }

  /// **Apple Sign-In**
  // Future<void> appleSignUp() async {
  //   emit(AuthLoading());
  //   try {
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName
  //       ],
  //     );

  //     final credential = OAuthProvider("apple.com").credential(
  //       idToken: appleCredential.identityToken,
  //       accessToken: appleCredential.authorizationCode,
  //     );

  //     final userCredential = await _auth.signInWithCredential(credential);
  //     emit(AuthSuccess(userCredential.user!));
  //   } catch (e) {
  //     emit(AuthFailure("Apple Sign-In Error: $e"));
  //   }
  // }

  /// **Facebook Sign-In**
  // Future<void> facebookSignUp() async {
  //   emit(AuthLoading());
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     if (result.status != LoginStatus.success) {
  //       emit(AuthFailure("Facebook Sign-In Canceled"));
  //       return;
  //     }

  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(result.accessToken!.token);

  //     final userCredential =
  //         await _auth.signInWithCredential(facebookAuthCredential);
  //     emit(AuthSuccess(userCredential.user!));
  //   } catch (e) {
  //     emit(AuthFailure("Facebook Sign-In Error: $e"));
  //   }
  // }

  /// **Sign Out**
  Future<void> signOut() async {
    await _auth.signOut();
    emit(AuthInitial());
  }
}
