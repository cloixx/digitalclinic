import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA-TxlRXfd_16EsMVjqSwcgV-wGhGWR9yQ",
            authDomain: "digital-hospital-ec770.firebaseapp.com",
            projectId: "digital-hospital-ec770",
            storageBucket: "digital-hospital-ec770.appspot.com",
            messagingSenderId: "153522495917",
            appId: "1:153522495917:web:676fe823013e2f48ae8124",
            measurementId: "G-KCT5TR9ZG6"));
  } else {
    await Firebase.initializeApp();
  }
}
