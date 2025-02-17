import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:wheater_app/core/network/firebase/firebase_sign.dart';
import 'package:wheater_app/futures/auth/signin/data/model/user_signin_model.dart';

abstract class RemoteSignin<Userinfo, Pramitar> {
  Userinfo remotesign(Pramitar signinmodel);
}

class SigninEmailAndpassword
    extends RemoteSignin<Future<UserCredential?>?, UserSigninModel> {
  @override
  Future<UserCredential?>? remotesign(signinpr) async {
    UserCredential? userdata;

    GetIt? getit = GetIt.instance;
    userdata = await getit<FirebaseSign>().signwithemailandpassword(
      signinpr.email,
      signinpr.password,
    );
    return userdata;
  }
}
