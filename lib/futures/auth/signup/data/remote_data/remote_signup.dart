import 'package:firebase_auth/firebase_auth.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/network/firebase/firebase_sign.dart';
import 'package:wheater_app/futures/auth/signup/data/model/UserSignUp_Model.dart';

abstract class BaseRemoteDataSourceSignUp {
  signup({UsersignupModel? usermodel});
}

class RemoteSignupemailandPassword extends BaseRemoteDataSourceSignUp {
  @override
  Future<User> signup({UsersignupModel? usermodel}) async {
    User userc = await sl<FirebaseSign>().createacountemailandpassword(
      email: usermodel!.email!,
      password: usermodel.password!,
    );
    return userc;
  }
}
