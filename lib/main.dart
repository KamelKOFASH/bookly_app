import 'package:bookly_app/app.dart';
import 'package:bookly_app/features/notifications/data/repositories/local_notifications_service.dart';
import 'package:bookly_app/features/notifications/data/repositories/push_notifications_service.dart';
import 'package:bookly_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.wait([
    PushNotificationsService.init(),
    LocalNotificationService.init(),
  ]);
  runApp(const BooklyApp());
}
