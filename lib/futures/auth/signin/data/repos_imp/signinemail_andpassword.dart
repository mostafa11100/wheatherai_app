import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/futures/auth/signin/data/model/user_responsemodel.dart';
import 'package:wheater_app/futures/auth/signin/data/model/user_signin_model.dart';
import 'package:wheater_app/futures/auth/signin/data/remotedata_source/remote_signin.dart';
import 'package:wheater_app/futures/auth/signin/domain/entity/usersignin_entity.dart';
import 'package:wheater_app/futures/auth/signin/domain/repo_interfaces/interface_signin_rebo.dart';

class SigninemailAndpasswordReboImp extends InterfaceSigninRebo {
  SigninemailAndpasswordReboImp(this._remote);
  final RemoteSignin _remote;
  @override
  Future<Either<Unit, Failure>> signin(UsersigninEntity entity) async {
    try {
      UserResponsemodel? user = await _remote.remotesign(
        UserSigninModel(entity.email, entity.password),
      );
      String id = user!.uid;
      sl<Cashhelper>().setuserid(id);

      sl<Cashhelper>().setuserlogin(true);

      return left(unit);
    } on FirebaseAuthException catch (e) {
      return Right(Failure.fromjson(e.code));
    } catch (e) {
      return Right(Failure.fromjson(e.toString()));
    }
  }
}
