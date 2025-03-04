// import 'package:cuddle_care/Constants/keys.dart';
// import 'package:cuddle_care/Service/Firebase/firebase_notification_service.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInScreen extends StatefulWidget {
//   const GoogleSignInScreen({super.key});


//   @override
//   State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
// }

// class _GoogleSignInScreenState extends State<GoogleSignInScreen> {


//   FirebaseNotificationService service = FirebaseNotificationService();

//   String token = 'cbtgpau6Sm6YNxGSUYMcel:APA91bFVAHrvfUY7JULtaOG48mpdwOxvJ-_CC9RXVPLgXH39RDGnDU0ukhLYMgHa35WnF5gLxpc6G_SpljzNVBd8Btwi0WlEtutt3rTsSenfvijko4wSyCfm-LRR0_w8hGDkJ3dBeXpU';

//   Future<User?> signInWithGoogle() async {
//     try {
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         // The user canceled the sign-in
//         return null;
//       }

//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       // Create a new credential
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Sign in to Firebase with the Google user credentials
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//       return userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       print('Error during Google Sign-In: ${e.message}');
//       return null;
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     service.requestNotificationPermission();
//     service.setUpInteractMessage(context);
//     service.isTokenRefresh();
//     service.getDeviceToken().then(
//             (value) {
//           debugPrint('token');
//           debugPrint(value);
//         }
//     );

//     service.firebaseInit(context);

//   }


//   @override
//   Widget build(BuildContext context) {



//     return Scaffold(
//       appBar: AppBar(title: const Text('Google Sign In')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () async {
//                 User? user = await signInWithGoogle();
//                 if (user != null) {
//                   print('Google Sign-In successful: ${user.email}');
//                 } else {
//                   print('Google Sign-In failed');
//                 }
//               },
//               child: const Text('Sign in with Google'),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () async {
//                 service.sendFCMNotification(KeysConstants.firebaseBearerToken, token);
//                 // service.sendNotifications(token);
//               },
//               child: const Text('Send Notification'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
