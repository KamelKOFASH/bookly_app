// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCnlEJzYU8OyM9rHW6ZM9OEV7pLaZNiW4M',
    appId: '1:15714464763:web:cf425904cb0595ce70115e',
    messagingSenderId: '15714464763',
    projectId: 'bookly-cf7fa',
    authDomain: 'bookly-cf7fa.firebaseapp.com',
    storageBucket: 'bookly-cf7fa.appspot.com',
    measurementId: 'G-NVGLHVECM4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBW9Llgk8fKxnLS8EjuJ6yg0P6wOX61JII',
    appId: '1:15714464763:android:bbabaaec13de66f070115e',
    messagingSenderId: '15714464763',
    projectId: 'bookly-cf7fa',
    storageBucket: 'bookly-cf7fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzZ95AQ6Evn_BLZkvyd2l7n6N8XhMO2Eo',
    appId: '1:15714464763:ios:7840274ae7da67ae70115e',
    messagingSenderId: '15714464763',
    projectId: 'bookly-cf7fa',
    storageBucket: 'bookly-cf7fa.appspot.com',
    iosBundleId: 'com.example.booklyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzZ95AQ6Evn_BLZkvyd2l7n6N8XhMO2Eo',
    appId: '1:15714464763:ios:7840274ae7da67ae70115e',
    messagingSenderId: '15714464763',
    projectId: 'bookly-cf7fa',
    storageBucket: 'bookly-cf7fa.appspot.com',
    iosBundleId: 'com.example.booklyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCnlEJzYU8OyM9rHW6ZM9OEV7pLaZNiW4M',
    appId: '1:15714464763:web:d5b00c4e97f791ad70115e',
    messagingSenderId: '15714464763',
    projectId: 'bookly-cf7fa',
    authDomain: 'bookly-cf7fa.firebaseapp.com',
    storageBucket: 'bookly-cf7fa.appspot.com',
    measurementId: 'G-LF7PJ98JER',
  );
}
