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
    apiKey: 'AIzaSyAxW3fJljS6t8rP1jd9z1pcjC3mtHCw6yI',
    appId: '1:1089677260809:web:9a8103dae1efb369fae0d8',
    messagingSenderId: '1089677260809',
    projectId: 'habit-app-7fc52',
    authDomain: 'habit-app-7fc52.firebaseapp.com',
    storageBucket: 'habit-app-7fc52.appspot.com',
    measurementId: 'G-GGJMZJYWVE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQYTLlQJ51jjG2rZMh4Nbp9a-k5gGzizE',
    appId: '1:1089677260809:android:eaddbdd6df447eeefae0d8',
    messagingSenderId: '1089677260809',
    projectId: 'habit-app-7fc52',
    storageBucket: 'habit-app-7fc52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPF_D_o_r6XMxF36niMcCBGXJXS72uTPg',
    appId: '1:1089677260809:ios:65d464fc7ee17aebfae0d8',
    messagingSenderId: '1089677260809',
    projectId: 'habit-app-7fc52',
    storageBucket: 'habit-app-7fc52.appspot.com',
    iosClientId: '1089677260809-4r1068am4edahp5cs3kivh1j3n4r621l.apps.googleusercontent.com',
    iosBundleId: 'com.example.habitApp',
  );
}