import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    // log(notificationResponse.id!.toString());
    // log(notificationResponse.payload!.toString());
    streamController.add(notificationResponse);
    // Navigator.push(context, route);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

//? show basic Notification
  static void showBasicNotification(RemoteMessage message) async {
    final http.Response image = await http
        .get(Uri.parse(message.notification?.android?.imageUrl ?? ''));
    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      ByteArrayAndroidBitmap.fromBase64String(
        base64Encode(image.bodyBytes),
      ),
      largeIcon: ByteArrayAndroidBitmap.fromBase64String(
        base64Encode(image.bodyBytes),
      ),
    );
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound(
      //     'long_notification_sound'.split('.').first),
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      details,
    );
  }

  //  basic Notification2
  // static void showBasicNotification2() async {
  //   AndroidNotificationDetails android = AndroidNotificationDetails(
  //       'id 3', 'basic notification1',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       sound:
  //           RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
  //   NotificationDetails details = NotificationDetails(
  //     android: android,
  //   );
  //   await flutterLocalNotificationsPlugin.show(
  //     4,
  //     'Basic Notification',
  //     'body',
  //     details,
  //     payload: "Payload Data",
  //   );
  // }

  // //showRepeatedNotification
  // static void showRepeatedNotification() async {
  //   const AndroidNotificationDetails android = AndroidNotificationDetails(
  //     'id 2',
  //     'repeated notification',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails details = const NotificationDetails(
  //     android: android,
  //   );
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     1,
  //     'Reapated Notification',
  //     'body',
  //     RepeatInterval.daily,
  //     details,
  //     payload: "Payload Data",
  //   );
  // }

  // //showSchduledNotification
  // static void showSchduledNotification() async {
  //   const AndroidNotificationDetails android = AndroidNotificationDetails(
  //     'schduled notification',
  //     'id 3',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails details = const NotificationDetails(
  //     android: android,
  //   );
  //   tz.initializeTimeZones();
  //   log(tz.local.name);
  //   log("Before ${tz.TZDateTime.now(tz.local).hour}");
  //   final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  //   log(currentTimeZone);
  //   tz.setLocalLocation(tz.getLocation(currentTimeZone));
  //   log(tz.local.name);
  //   log("After ${tz.TZDateTime.now(tz.local).hour}");
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     2,
  //     'Schduled Notification',
  //     'body',
  //     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
  //     // tz.TZDateTime(
  //     //   tz.local,
  //     //   2024,
  //     //   2,
  //     //   10,
  //     //   21,
  //     //   30,
  //     // ),
  //     details,
  //     payload: 'zonedSchedule',
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  // //showDailySchduledNotification
  // static void showDailySchduledNotification() async {
  //   const AndroidNotificationDetails android = AndroidNotificationDetails(
  //     'daily schduled notification',
  //     'id 4',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails details = const NotificationDetails(
  //     android: android,
  //   );
  //   tz.initializeTimeZones();
  //   tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
  //   var currentTime = tz.TZDateTime.now(tz.local);
  //   log("currentTime.year:${currentTime.year}");
  //   log("currentTime.month:${currentTime.month}");
  //   log("currentTime.day:${currentTime.day}");
  //   log("currentTime.hour:${currentTime.hour}");
  //   log("currentTime.minute:${currentTime.minute}");
  //   log("currentTime.second:${currentTime.second}");
  //   var scheduleTime = tz.TZDateTime(
  //     tz.local,
  //     currentTime.year,
  //     currentTime.month,
  //     currentTime.day,
  //     currentTime.hour,
  //     7,
  //   );
  //   log("scheduledTime.year:${scheduleTime.year}");
  //   log("scheduledTime.month:${scheduleTime.month}");
  //   log("scheduledTime.day:${scheduleTime.day}");
  //   log("scheduledTime.hour:${scheduleTime.hour}");
  //   log("scheduledTime.minute:${scheduleTime.minute}");
  //   log("scheduledTime.second:${scheduleTime.second}");
  //   if (scheduleTime.isBefore(currentTime)) {
  //     scheduleTime = scheduleTime.add(const Duration(hours: 1));
  //     log("AfterAddedscheduledTime.year:${scheduleTime.year}");
  //     log("AfterAddedscheduledTime.month:${scheduleTime.month}");
  //     log("AfterAddedscheduledTime.day:${scheduleTime.day}");
  //     log("AfterAddedscheduledTime.hour:${scheduleTime.hour}");
  //     log("AfterAddedscheduledTime.minute:${scheduleTime.minute}");
  //     log("AfterAddedscheduledTime.second:${scheduleTime.second}");
  //     log('Added Duration to scheduled time');
  //   }
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     3,
  //     'Daily Schduled Notification',
  //     'body',
  //     // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
  //     scheduleTime,
  //     details,
  //     payload: 'zonedSchedule',
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  // static void cancelNotification(int id) async {
  //   await flutterLocalNotificationsPlugin.cancel(id);
  // }
}
