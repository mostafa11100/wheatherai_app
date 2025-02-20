import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/network/firebase/firebase_sign.dart';
import 'package:wheater_app/futures/auth/signin/data/model/user_responsemodel.dart';
import 'package:wheater_app/futures/auth/signin/data/model/user_signin_model.dart';

abstract class RemoteSignin<Userinfo, Pramitar> {
  Future<Userinfo> remotesign(Pramitar signinmodel);
}

class SigninEmailAndpassword
    extends RemoteSignin<UserResponsemodel, UserSigninModel> {
  @override
  Future<UserResponsemodel> remotesign(UserSigninModel signinpr) async {
    UserCredential? userdata;

    userdata = await sl<FirebaseSign>().signwithemailandpassword(
      signinpr.email,
      signinpr.password,
    );
    return UserResponsemodel.fromFirebase(userdata);
  }
}
