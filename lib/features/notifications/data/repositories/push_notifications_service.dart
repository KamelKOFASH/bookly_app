import 'dart:developer';
import 'package:bookly_app/features/notifications/data/repositories/local_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  // static String? token;

  static Future init() async {
    await messaging.requestPermission();
    await messaging.getToken().then((token) {
      sendTokenToServer(token!);
    });
    messaging.onTokenRefresh.listen((newToken) => sendTokenToServer(newToken));
    // log(token ?? 'No token');
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
    messaging.subscribeToTopic('all').then((value) {
      log("subscribed to all");
    });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.data.toString());
  }

  static void sendTokenToServer(String token) {
    //? Option1 => Api
    //? Option2 => Firebase
  }
}

//! PostMan Links for push notifications from firebase test
//https://fcm.googleapis.com/v1/projects/bookly-cf7fa/messages:send
//https://oauth.pstmn.io/v1/callback
//https://oauth.pstmn.io/v1/browser-callback
