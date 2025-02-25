import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/auth/signup/data/model/UserSignUp_Model.dart';
import 'package:wheater_app/futures/auth/signup/data/remote_data/add_userdata_remote.dart';
import 'package:wheater_app/futures/auth/signup/domain/enititys/signup_entitys.dart';
import 'package:wheater_app/futures/auth/signup/domain/interfaces/adduser_info.dart';

class AddUserInfo extends BaseclassAddUserInfo {
  final BaseAddUserDateRemote _remote;
  AddUserInfo(this._remote);
  @override
  Future<Either<Failure, Unit>> adduser({SignUpEntity? entity}) async {
    UsersignupModel userSigninModel = UsersignupModel(
      name: entity!.name,
      uid: entity.uid,
      tall: entity.tall!,
      weight: entity.weight,
      birthdate: entity.birthdate,
    );
    try {
      await _remote.adduserinfo(userSigninModel);
      return Right(unit);
    } on FirebaseException catch (e) {
      return Left(Failure.fromjson(e.code));
    } catch (e) {
      return Left(Failure.fromjson(e.toString()));
    }
  }
}
