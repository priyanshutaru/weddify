import 'dart:io';

import 'package:firebase_core/firebase_core.dart';


//********************------------- This is authentic that user is ios or android.  -------------********************//
class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return  const FirebaseOptions(
        appId: '1:283466351178:ios:11f94d8546d09dc5939cb3',
        apiKey: 'AIzaSyDZMrO_9KcpEJc8yMiIL4oYEi9a5gFOzHI',
        projectId: 'e-commerce-6455a',
        messagingSenderId: '283466351178	',
        iosBundleId: 'com.example.youtubeEcommerce',
      );
    } else {
      // Android
      return  const FirebaseOptions(
        appId: '1:720542394888:android:8b695dd45ce077725dbfbd',
        apiKey: 'AIzaSyAAMzp42u4Zhi2fqJYxHUdwdLjS-j6mpCk',
        projectId: 'weddify-ddfba',
        messagingSenderId: '720542394888',
        storageBucket: "gs://weddify-ddfba.appspot.com",
      );
    }
  }
}