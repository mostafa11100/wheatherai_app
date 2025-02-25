// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSign {
  Future<UserCredential> signwithemailandpassword(email, password) async {
    final UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return credential;
  }

  Future<User> createacountemailandpassword({
    required String email,
    required String password,
  }) async {
    final UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }
}
