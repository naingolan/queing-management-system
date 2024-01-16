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
    apiKey: 'AIzaSyBpAy2rdUNanq8x8aGGweno0R9SRbZ_kdU',
    appId: '1:534391158576:web:c00e8ea5cf8f089b68baf5',
    messagingSenderId: '534391158576',
    projectId: 'queuing-management-system',
    authDomain: 'queuing-management-system.firebaseapp.com',
    storageBucket: 'queuing-management-system.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiojWe6lXAyJfHDzmdMuNsC31KKkMpNPw',
    appId: '1:534391158576:android:9af676fed36c12b268baf5',
    messagingSenderId: '534391158576',
    projectId: 'queuing-management-system',
    storageBucket: 'queuing-management-system.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2UOo6DgpJye8trojPPwgfe-vPNnxo5D4',
    appId: '1:534391158576:ios:98aceb1c33afc05468baf5',
    messagingSenderId: '534391158576',
    projectId: 'queuing-management-system',
    storageBucket: 'queuing-management-system.appspot.com',
    iosBundleId: 'com.nainggolan.queuingManagementSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2UOo6DgpJye8trojPPwgfe-vPNnxo5D4',
    appId: '1:534391158576:ios:a2437d4e590bc97768baf5',
    messagingSenderId: '534391158576',
    projectId: 'queuing-management-system',
    storageBucket: 'queuing-management-system.appspot.com',
    iosBundleId: 'com.nainggolan.queuingManagementSystem.RunnerTests',
  );
}