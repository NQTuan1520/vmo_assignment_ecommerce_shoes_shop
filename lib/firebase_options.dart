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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCOoZpSROAuYbXWD6uMiDkHON6wktkrogM',
    appId: '1:359520686837:web:1bf53d40c482084993ebbc',
    messagingSenderId: '359520686837',
    projectId: 'vmo-assignment',
    authDomain: 'vmo-assignment.firebaseapp.com',
    storageBucket: 'vmo-assignment.appspot.com',
    measurementId: 'G-RVD0QZHHTB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZTy1wryI_iMkJMk0GMx185pvSms8cST0',
    appId: '1:359520686837:android:9174d1d8244a02f093ebbc',
    messagingSenderId: '359520686837',
    projectId: 'vmo-assignment',
    storageBucket: 'vmo-assignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUClM5BTix1nmDyR81b_B7QYMBfqBpltI',
    appId: '1:359520686837:ios:71941a53ef95fcb993ebbc',
    messagingSenderId: '359520686837',
    projectId: 'vmo-assignment',
    storageBucket: 'vmo-assignment.appspot.com',
    iosBundleId: 'com.example.vmoAssignmentEcommerceShoesShop',
  );
}
