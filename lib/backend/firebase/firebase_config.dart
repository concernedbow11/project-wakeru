import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDZU2eph46ZVOYW58KQbIEdg9aDAudjofs",
            authDomain: "wakeru-14842.firebaseapp.com",
            projectId: "wakeru-14842",
            storageBucket: "wakeru-14842.appspot.com",
            messagingSenderId: "177867397436",
            appId: "1:177867397436:web:8b309ddf55887a61af2639",
            measurementId: "G-SNVK8BTPNF"));
  } else {
    await Firebase.initializeApp();
  }
}
