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
    apiKey: 'AIzaSyAeCwccvhXIojd2Vx1g0CZNL_MHw8nDPs0',
    appId: '1:1093250405799:web:1ca7bfb980c2349baf5282',
    messagingSenderId: '1093250405799',
    projectId: 'pomodoro-nepal',
    authDomain: 'pomodoro-nepal.firebaseapp.com',
    storageBucket: 'pomodoro-nepal.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYefEIlu2pgsYmjsMDFYzK7HtN0Xc5sUY',
    appId: '1:1093250405799:android:371b0bf6220d8e30af5282',
    messagingSenderId: '1093250405799',
    projectId: 'pomodoro-nepal',
    storageBucket: 'pomodoro-nepal.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDlx-HoZPOmKzgg4z94mxwInSDPoRUYpo',
    appId: '1:1093250405799:ios:7ff4db6636958933af5282',
    messagingSenderId: '1093250405799',
    projectId: 'pomodoro-nepal',
    storageBucket: 'pomodoro-nepal.appspot.com',
    iosClientId: '1093250405799-gse03gprj4bg8dn65ala9n5g2j647un2.apps.googleusercontent.com',
    iosBundleId: 'com.pomodoronepal.pomodoronepal',
  );
}
