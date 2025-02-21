import 'package:firebase_auth/firebase_auth.dart';

class UserResponsemodel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final bool isNewUser;

  UserResponsemodel({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    required this.isNewUser,
  });

  // دالة تحويل من Firebase UserCredential إلى UserModel
  factory UserResponsemodel.fromFirebase(UserCredential userCredential) {
    return UserResponsemodel(
      uid: userCredential.user?.uid ?? "",
      email: userCredential.user?.email,
      displayName: userCredential.user?.displayName,
      photoUrl: userCredential.user?.photoURL,
      isNewUser: userCredential.additionalUserInfo?.isNewUser ?? false,
    );
  }
}
