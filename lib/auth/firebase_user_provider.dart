import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WakeruFirebaseUser {
  WakeruFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WakeruFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WakeruFirebaseUser> wakeruFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WakeruFirebaseUser>(
      (user) {
        currentUser = WakeruFirebaseUser(user);
        return currentUser!;
      },
    );
