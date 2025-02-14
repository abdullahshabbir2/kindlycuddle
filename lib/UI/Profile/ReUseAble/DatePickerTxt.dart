import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as dtp;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({Key? key}) : super(key: key);

  @override
  DatePickerTxtState createState() => DatePickerTxtState();
}

class DatePickerTxtState extends State<DatePickerTxt> {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  DateTime? _selectedTime;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Dhaka'));
    _initializeNotifications();
    //Future.delayed(const Duration(seconds: 3), () => showTestNotification());
  }

  Future<void> showTestNotification() async {
    await notificationsPlugin.show(
      0,
      "Test Notification",
      "This is a test",
      await notificationDetails(),
    );
  }

  // Initialize notifications
  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iOSInitSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iOSInitSettings,
    );

    await notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint("🔔 Notification Clicked: ${response.payload}");
      },
    );
  }

  Future<void> openExactAlarmSettings() async {
    const intent = AndroidIntent(
      action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
      flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  Future<void> _checkPermissions() async {
    var notificationStatus = await Permission.notification.status;
    var exactAlarmStatus = await Permission.scheduleExactAlarm.status;

    debugPrint("📢 Notification Permission: $notificationStatus");
    debugPrint("⏰ Exact Alarm Permission: $exactAlarmStatus");
  }

  Future<void> _requestAllNotificationPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.notification, // ✅ For general notifications
      Permission.scheduleExactAlarm, // ✅ For scheduled notifications
    ].request();

    if (statuses[Permission.notification]?.isGranted == true &&
        statuses[Permission.scheduleExactAlarm]?.isGranted == true) {
      debugPrint("✅ All Notification Permissions Granted");
    } else {
      debugPrint("❌ Some Notification Permissions Denied");
    }
  }

  // Notification details
  Future<NotificationDetails> notificationDetails() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'scheduled_notifications_channel', // Channel ID
      'Scheduled Notifications', // Channel Name
      channelDescription: 'This channel is used for scheduled notifications',
      importance: Importance.max, // Ensure high importance
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(),
    );

    return platformChannelSpecifics;
  }

  // Schedule notification
  Future<void> scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    required DateTime scheduledNotificationDateTime,
  }) async {
    tz.TZDateTime scheduledTime =
        tz.TZDateTime.from(scheduledNotificationDateTime, tz.local);

    debugPrint("⏰ Scheduling Notification at: $scheduledTime (Asia/Dhaka)");

    await notificationsPlugin.zonedSchedule(
      id,
      title ?? "Reminder",
      body ?? "You have a scheduled event",
      scheduledTime,
      await notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents:
          DateTimeComponents.time, // Ensures time-based execution
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: "Test Payload",
    );

    debugPrint("✅ Notification Scheduled Successfully!");
  }

  // Pick a time and schedule notification
  void _pickTimeAndScheduleNotification() {
    dtp.DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.now(), // Start from the current time
      locale: dtp.LocaleType.en, // Ensures AM/PM format
      onConfirm: (date) {
        setState(() {
          _selectedTime = date;
        });
        scheduleNotification(
          id: 0,
          title: "Test Notification",
          body: "This is a test notification",
          scheduledNotificationDateTime: date,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: _pickTimeAndScheduleNotification,
          child: const Text(
            "Select Notification Time!",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        if (_selectedTime != null)
          Text(
            "Selected Time: ${_selectedTime!.hour}:${_selectedTime!.minute}",
            style: const TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
