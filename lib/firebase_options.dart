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
    apiKey: 'AIzaSyAiYgbv1YbMIESR1kSJWms-8Xfj8210294',
    appId: '1:456464623815:web:a7de545cdcb0113c9f36e2',
    messagingSenderId: '456464623815',
    projectId: 'asdish-app',
    authDomain: 'asdish-app.firebaseapp.com',
    storageBucket: 'asdish-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6LvyneHNvzqWVik7hA-vQ9u8QDUIKA6w',
    appId: '1:456464623815:android:32a1e905d7b3ca0b9f36e2',
    messagingSenderId: '456464623815',
    projectId: 'asdish-app',
    storageBucket: 'asdish-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_DeuhRcuYoEgplTm__-q3F-W0HBZvwP4',
    appId: '1:456464623815:ios:876229b382706a579f36e2',
    messagingSenderId: '456464623815',
    projectId: 'asdish-app',
    storageBucket: 'asdish-app.appspot.com',
    iosBundleId: 'com.example.asdish',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_DeuhRcuYoEgplTm__-q3F-W0HBZvwP4',
    appId: '1:456464623815:ios:876229b382706a579f36e2',
    messagingSenderId: '456464623815',
    projectId: 'asdish-app',
    storageBucket: 'asdish-app.appspot.com',
    iosBundleId: 'com.example.asdish',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAiYgbv1YbMIESR1kSJWms-8Xfj8210294',
    appId: '1:456464623815:web:e969ba18432f255e9f36e2',
    messagingSenderId: '456464623815',
    projectId: 'asdish-app',
    authDomain: 'asdish-app.firebaseapp.com',
    storageBucket: 'asdish-app.appspot.com',
  );
}
