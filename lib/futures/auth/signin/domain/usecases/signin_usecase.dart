import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/auth/signin/domain/entity/usersignin_entity.dart';
import 'package:wheater_app/futures/auth/signin/domain/repo_interfaces/interface_signin_rebo.dart';

class SigninUsecase {
  InterfaceSigninRebo _signinRebo;
  SigninUsecase(this._signinRebo);
  Future<Either<Unit, Failure>> signin(UsersigninEntity entity) async {
    try {
      Either<Unit, Failure> result = await _signinRebo.signin(entity);
      return result;
    } catch (e) {
      return Right(Failure.fromjson(e.toString()));
    }
  }
}
