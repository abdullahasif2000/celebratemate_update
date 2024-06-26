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
    apiKey: 'AIzaSyBkyOKvINMqYeLQsh06UpwqVoyXo5-YlS0',
    appId: '1:843369016489:web:9be4ae646dd4fe89718db8',
    messagingSenderId: '843369016489',
    projectId: 'celebratemate-d8420',
    authDomain: 'celebratemate-d8420.firebaseapp.com',
    storageBucket: 'celebratemate-d8420.appspot.com',
    measurementId: 'G-V75H4KMR20',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyXi_5gIHLl9r-ZRqFJc0osdeqeGSvNic',
    appId: '1:843369016489:android:16ba243faf6052e7718db8',
    messagingSenderId: '843369016489',
    projectId: 'celebratemate-d8420',
    storageBucket: 'celebratemate-d8420.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC10ah7k9siwobluaq0b6lpChtMCD_kS08',
    appId: '1:843369016489:ios:9af7d6c526ab34cd718db8',
    messagingSenderId: '843369016489',
    projectId: 'celebratemate-d8420',
    storageBucket: 'celebratemate-d8420.appspot.com',
    iosBundleId: 'com.example.celebratemate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC10ah7k9siwobluaq0b6lpChtMCD_kS08',
    appId: '1:843369016489:ios:9af7d6c526ab34cd718db8',
    messagingSenderId: '843369016489',
    projectId: 'celebratemate-d8420',
    storageBucket: 'celebratemate-d8420.appspot.com',
    iosBundleId: 'com.example.celebratemate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBkyOKvINMqYeLQsh06UpwqVoyXo5-YlS0',
    appId: '1:843369016489:web:6cf7663e62958866718db8',
    messagingSenderId: '843369016489',
    projectId: 'celebratemate-d8420',
    authDomain: 'celebratemate-d8420.firebaseapp.com',
    storageBucket: 'celebratemate-d8420.appspot.com',
    measurementId: 'G-FG3639FWCT',
  );
}
