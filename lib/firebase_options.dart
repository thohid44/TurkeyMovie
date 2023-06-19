// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyAEPnWa3ZjCqM467rqKABvWE37b1RAqk34',
    appId: '1:1021442659528:web:9cdef4a8097f37043201fd',
    messagingSenderId: '1021442659528',
    projectId: 'arturul',
    authDomain: 'arturul.firebaseapp.com',
    storageBucket: 'arturul.appspot.com',
    measurementId: 'G-F25RD5C30S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_244DJ9nMxhWFZcciouTLSjaataVwYls',
    appId: '1:1021442659528:android:63d7b60239ecaa643201fd',
    messagingSenderId: '1021442659528',
    projectId: 'arturul',
    storageBucket: 'arturul.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvuqtutteXPcq5lNI_isRKTvXDKpXmPgA',
    appId: '1:1021442659528:ios:aa21b2c6421b8fb83201fd',
    messagingSenderId: '1021442659528',
    projectId: 'arturul',
    storageBucket: 'arturul.appspot.com',
    iosClientId: '1021442659528-arcb0m4bnrueh7roiv2pat3js4vtv032.apps.googleusercontent.com',
    iosBundleId: 'com.example.erthurul',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvuqtutteXPcq5lNI_isRKTvXDKpXmPgA',
    appId: '1:1021442659528:ios:aa21b2c6421b8fb83201fd',
    messagingSenderId: '1021442659528',
    projectId: 'arturul',
    storageBucket: 'arturul.appspot.com',
    iosClientId: '1021442659528-arcb0m4bnrueh7roiv2pat3js4vtv032.apps.googleusercontent.com',
    iosBundleId: 'com.example.erthurul',
  );
}
