import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/futures/auth/signin/data/model/user_signin_model.dart';
import 'package:wheater_app/futures/auth/signin/data/remotedata_source/remote_signin.dart';
import 'package:wheater_app/futures/auth/signin/domain/entity/usersignin_entity.dart';
import 'package:wheater_app/futures/auth/signin/domain/repo_interfaces/interface_signin_rebo.dart';

class SigninemailAndpasswordReboImp extends InterfaceSigninRebo {
  RemoteSignin? _remote;
  @override
  Future<Either<Unit, Failure>> signin(UsersigninEntity entity) async {
    try {
      final gt = GetIt.instance;
      _remote = SigninEmailAndpassword();
      UserCredential userCredential = await _remote!.remotesign(
        UserSigninModel(entity.email, entity.password),
      );

      String id = userCredential.user!.uid;
      gt<Cashhelper>().setuserid(id);

      gt<Cashhelper>().setuserlogin(true);

      return left(unit);
    } on FirebaseAuthException catch (e) {
      print("errrrrrrrrror${Failure.fromjson(e.code).error}");
      return Right(Failure.fromjson(e.code));
    } catch (e) {
      print("errrrrrrrrror222${e.toString()}");
      return Right(Failure.fromjson(e.toString()));
    }
  }
}
