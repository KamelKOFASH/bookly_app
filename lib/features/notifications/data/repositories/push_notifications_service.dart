import 'dart:developer';
import 'package:bookly_app/features/notifications/data/repositories/local_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future init() async {
    await messaging.requestPermission();
    token = await messaging.getToken();
    log(token ?? 'No token');

    //? تمكين تشغيل الرسالة في الخلفية وايضا في حالة غلق التطبيق
    //? BackgroundMessage or Killed
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    //? تمكين الرسالة في حالة التطبيق مفتوح
    //? ForegroundMessage
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //? show local notification
      LocalNotificationService.showBasicNotification(
        message,
      );
    });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.data.toString());
  }
}

//! PostMan Links for push notifications from firebase test
//https://fcm.googleapis.com/v1/projects/bookly-cf7fa/messages:send
//https://oauth.pstmn.io/v1/callback
//https://oauth.pstmn.io/v1/browser-callback
