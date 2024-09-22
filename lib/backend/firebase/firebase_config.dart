import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDHUSQ4jm-GXaINDu0GM2OS3YDYmITYjto",
            authDomain: "to-do-umix9y.firebaseapp.com",
            projectId: "to-do-umix9y",
            storageBucket: "to-do-umix9y.appspot.com",
            messagingSenderId: "582301068563",
            appId: "1:582301068563:web:c117157e1db75df0467ee6"));
  } else {
    await Firebase.initializeApp();
  }
}
