import 'dart:math';
import 'package:cuddle_care/Constants/keys.dart';
import 'package:cuddle_care/message_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert'; // for jsonEncode
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as serviceControl;

class FirebaseNotificationService{
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initLocalNotifications(BuildContext context , RemoteMessage message) async {
    var androidInitializeSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializeSetting = DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializeSetting,
        iOS: iosInitializeSetting
    );

    await flutterLocalNotificationsPlugin.initialize(
        initializationSetting,
        onDidReceiveNotificationResponse: (payload){
          handleMessage(context, message);
        }
    );

  }


  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {

      debugPrint(message.data['type']);
      debugPrint(message.data['id']);

      // if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      // }
    });
  }

  Future<void> showNotification(RemoteMessage message)async{

    AndroidNotificationDetails channel = AndroidNotificationDetails(
        Random.secure().nextInt(1000).toString(),
        'High Importance Notification',
        importance: Importance.max
    );
    
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        Random.secure().nextInt(10000).toString(),
        'High Importance Notification',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker'
    );

    DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails
    );

    Future.delayed(Duration.zero,(){
      flutterLocalNotificationsPlugin.show(
          1,
          message.notification?.title.toString(),
          message.notification?.body.toString(),
          notificationDetails
      );
    }

    );
  }

  // void firebaseInit(){
  //   FirebaseMessaging.onMessage.listen((message) {
  //     debugPrint(message.notification!.title.toString());
  //     debugPrint(message.notification?.body.toString());
  //
  //     showMessage(message);
  //
  //   });
  // }

  void requestNotificationPermission() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      debugPrint('Notification Authorization');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      debugPrint('Notification Provisional Authorization');
    }else{
      debugPrint('Notification Denied');
    }

  }

  Future<String> getDeviceToken() async {
    String? token = await firebaseMessaging.getToken();
    return token??'';
  }

  void isTokenRefresh() async {
    firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  Future<void> setUpInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // when app is terminated
    if(initialMessage != null){
      handleMessage(context, initialMessage);
    }

    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(
            (event) {
              handleMessage(context, event);
            }
    );

  }

  void handleMessage(BuildContext context , RemoteMessage message){
    debugPrint(message.data.toString());

    var id = message.data['id'];

    Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage(id: id) ));

  }

  Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "cuddlecare-339ea",
      "private_key_id": "d37e6f6f0100613fa247c5f3a4731b47f0039a9f",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC2fIWWWnQM4IHT\nOe2pPExHSVhWK8mr88Gro/kujrg+MkbA8kj5yDsAJHjvp9f+SLA6WAqOLOOrVOGW\nlN7PXsjMs9vK0QFhF35TU0wJlRbk8c02k1FiPcVy9iQSnsoPy2UqdaD8wVYw7jAZ\n2F5OKuFLNa8ZYx95IPsIT8LovDHapQsZQHJM/mg/M7UJ/jb+1a3d/M6PHBMx5Y+j\nDtXAA5i72EdGHeKsLeBNKRk+5MI/mYTs7PLGFbXz/uN+DaQmvHTFDq569Ad4a3hJ\n4P0L9Tw6buttra3EhS7X7JDVyQKHeBgIJAQTyBy0NvgRiZfM8TEJC7BB7nw372p7\nCBXKdGUxAgMBAAECggEAAoEwBjHEoP6d2YvUfrukol/X1grw0Cre0B/GhkSQM85V\n2UUaCk+cu7JEdKmdldBiltJphq0IDOxz0jDF5Bu9bs3TKPP4bGA5rCQbCZChyU+m\nTOb1uX72jE7jjNvgExpsD4qgxIdUywQh5eDp3nHJONKKTjNllbCFsYYCu1YF6yXN\n04weGKgsqs4AzYsnXNi3vo1I6MvISxSEPi4cCzymSgVkXcKh9KRhAUiyLsmZ8MRt\nh0yo4uVJAN0yw4HA/97iVGv6jczLtrOGMa6sHV25X/J+22TEowqFPJUT2lrCp1GC\ndctKf+5yD+Up8zom2AYajgOC08ty95j3okC5KZ5FfwKBgQDcI3wJkgioN1RulRa8\nqPsFcIZmcuONyAn7N0xeHWu9SqClzh0xQ9TPte1Lf1FjMUipkViJMz9SxZLUWcCD\nTSQOk/AaDC+Yo8Az+hPrjXLX9aoUWz9YEr5RCUbWST4+9prMU3GYr2DwG03HbRms\nUEFqZe8+pBM7iCPjyiUjsFx3RwKBgQDUNtCbK00H5hkpRYe8XPJBCkUudIkJyvYZ\nIc4SgKuhMUXAKZhTID+NDtoNXJht5IRJJk40er1fAxrpOzTvb50uLi+FRPk5Cq0B\nFjUBi6WdI+8oyNNcJv0BEZT0oJMD3Rdq7PoOQ4wINqihF2M8HzWouHAFGJVzVSrx\nx/rgW/9rxwKBgCx1rjNwnvb6Vb8PtUvdBPWQSFSgl3ynDf0CqhXH816Dl/Zkrlio\nzm402/wHdrSF25sDk9IB26Qn6wOgLNVX2xRmpHNeSq6VQ9g7hZJpOuyK3RLHav+q\nqW1MZlYY7M1imNjzcVnY8ccMfKTuT+URQGTwuWT5VjkLwdPbm6ydjc85AoGAeUQh\njKn/yMW6FxV+bSsH3BbMVbGOJaRvYQkqQvR4HxKS8y5Rtx60chzMidoh2Jo+5bYX\n9nE1CbgyhpiotTIotZz61sMFT41EM1zHSWzNZLCGF946uWwmI5gycF/Z4tlSam2k\nrsX2nTLuxa8hq9eByDos+RyFOnSup59JQzAPEz0CgYEA0nONdTJdKVjv04YSr4qG\n7c1PfEVzT+QmkYG2eoMz0FhjaDzeLIYjOtkCnXmsuy90gHFGDP6kVVS9oTrXTqBg\nQGhPzWL++IEo2YLnjo4c5YxujaDZ9Ym6PtnmQpQmpyCVL7HPyjjDmbGojyw5s36q\n8s0SDP8e3eLx8ORnLSjki6Q=\n-----END PRIVATE KEY-----\n",
      "client_email": "firebase-adminsdk-4j8qa@cuddlecare-339ea.iam.gserviceaccount.com",
      "client_id": "106375416192190032392",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-4j8qa%40cuddlecare-339ea.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    http.Client client = await auth.clientViaServiceAccount(
    auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
    scopes
    );

    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client
    );

    client.close();

    return credentials.accessToken.data;

  }
  

  Future<void> sendFCMNotification(String serverKey, String deviceToken) async {
    // final url = Uri.parse('https://fcm.googleapis.com/fcm/send');

     String serverAccessKey = await getAccessToken();

     // serverAccessKey = 'cbtgpau6Sm6YNxGSUYMcel:APA91bFVAHrvfUY7JULtaOG48mpdwOxvJ-_CC9RXVPLgXH39RDGnDU0ukhLYMgHa35WnF5gLxpc6G_SpljzNVBd8Btwi0WlEtutt3rTsSenfvijko4wSyCfm-LRR0_w8hGDkJ3dBeXpU';

     debugPrint(serverAccessKey);

     Map<String,dynamic> message = {
       'message':{
         'token':deviceToken,
         'notification': {
           'title':'salam',
           'body':'Salam from Hamza'
         },
         'data':{
           'tripId':'123'
         }
       }
     };

     http.Response response =  await http.post(
         Uri.parse('https://fcm.googleapis.com/v1/projects/' + KeysConstants.projectId + '/messages:send'),
        headers: <String,String>{
           'Content-Type':'application/json',
           'Authorization':'Bearer $serverAccessKey'
        },
       body: jsonEncode(message)
     );

     if (response.statusCode == 200) {
           print("Notification sent successfully.");
         } else {
           print("Failed to send notification. Status code: ${response.statusCode}");
           print("Response body: ${response.body}");
         }

    // final url = Uri.parse('https://fcm.googleapis.com/v1/projects/' + KeysConstants.projectId + '/messages:send');
    //
    // final headers = {
    //   'Authorization': 'key=$serverKey',
    //   'Content-Type': 'application/json',
    // };
    //
    // final body = {
    //   "to": deviceToken,
    //   "notification": {
    //     "title": "Test Notification",
    //     "body": "This is a test notification from Firebase",
    //   }
    // };
    //
    // try {
    //   final response = await http.post(
    //     url,
    //     headers: headers,
    //     body: jsonEncode(body),
    //   );
    //
    //   if (response.statusCode == 200) {
    //     print("Notification sent successfully.");
    //   } else {
    //     print("Failed to send notification. Status code: ${response.statusCode}");
    //     print("Response body: ${response.body}");
    //   }
    // } catch (e) {
    //   print("Error sending notification: $e");
    // }

  }

  sendNotifications(String deviceToken,) async {
    final url = Uri.parse('https://fcm.googleapis.com/v1/projects/' + KeysConstants.projectId + '/messages:send');

    String serverKey = KeysConstants.firebaseBearerToken;

    final headers = {
      'Authorization': 'key=$serverKey',
      'Content-Type': 'application/json',
    };

    final body = {
      "to": deviceToken,
      "notification": {
        "title": "Test Notification",
        "body": "This is a test notification from Firebase",
      }
    };

    try {
      // final response = await http.post(
      //   url,
      //   headers: headers,
      //   body: jsonEncode(body),
      // );

      http.Response response =  await http.post(
          Uri.parse('https://fcm.googleapis.com/v1/projects/' + KeysConstants.projectId + '/messages:send'),
          headers: <String,String>{
            'Content-Type':'application/json',
            'Authorization':'Bearer $serverKey'
          },
          body: jsonEncode(body)
      );

      if (response.statusCode == 200) {
        print("Notification sent successfully.");
      } else {
        print("Failed to send notification. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }

}