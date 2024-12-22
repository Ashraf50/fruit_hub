import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool loginStatus() {
    return _firebaseAuth.currentUser != null;
  }
}
