import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/futures/auth/signup/data/model/UserSignUp_Model.dart';
import 'package:wheater_app/futures/auth/signup/domain/enititys/signup_entitys.dart';
import 'package:wheater_app/futures/auth/signup/domain/interfaces/adduser_info.dart';
import 'package:wheater_app/futures/auth/signup/domain/interfaces/signup_interface.dart';
import 'package:wheater_app/futures/auth/signup/domain/usecases/BaseUseCaseSignUp.dart';

class SignUpAddUserUseCase extends Baseusecasesignup {
  final BaseSignUpRebo _signupauth;
  final BaseclassAddUserInfo _addUserInfo;
  SignUpAddUserUseCase(this._signupauth, this._addUserInfo);

  signup(SignUpEntity entity) async {}

  @override
  Future<Either<Failure, Unit>> usecasesignup(SignUpEntity entity) async {
    late Either<Failure, Unit> result;
    try {
      Either<Failure, Unit> authresult = await _signupauth.signup(
        signupentity: entity,
      );
      await authresult.fold(
        (left) {
          result = Left(left);
        },
        (_) async {
          String? uid = await sl<Cashhelper>().getuserid();
          entity.uid = uid;

          Either<Failure, Unit> useradded = await _addUserInfo.adduser(
            entity: entity,
          );
          await useradded.fold(
            (left) async {
              //add user data to local   and try added another time

              await sl<Cashhelper>().setuserinfo(
                UsersignupModel(
                  name: entity.name,
                  uid: entity.uid,
                  tall: entity.tall,
                  weight: entity.weight,
                ).tojson(),
              );
              result = Left(left);
            },
            (_) {
              result = Right(unit);
            },
          );
          //addd user data
        },
      );

      return result;
    } catch (e) {
      return Left(Failure.fromjson(e.toString()));
    }
  }
}
