import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/futures/auth/signup/data/model/UserSignUp_Model.dart';
import 'package:wheater_app/futures/auth/signup/data/remote_data/remote_signup.dart';
import 'package:wheater_app/futures/auth/signup/domain/enititys/signup_entitys.dart';
import 'package:wheater_app/futures/auth/signup/domain/interfaces/signup_interface.dart';

class SignUpReboEmailAndPassword extends BaseSignUpRebo {
  final BaseRemoteDataSourceSignUp _remoteDataSourceSignUp;
  SignUpReboEmailAndPassword(this._remoteDataSourceSignUp);
  @override
  Future<Either<Failure, Unit>> signup({SignUpEntity? signupentity}) async {
    try {
      UserCredential result = await _remoteDataSourceSignUp.signup(
        usermodel: UsersignupModel(
          email: signupentity!.email!,
          password: signupentity.password,
        ),
      );
      String uid = result.user!.uid;
      sl<Cashhelper>().setuserid(uid);
      return Right(unit);
    } on FirebaseException catch (e) {
      return Left(Failure.fromjson(e.code));
    }
  }
}
