import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/auth/signup/domain/enititys/signup_entitys.dart';

abstract class Baseusecasesignup {
  Future<Either<Failure, Unit>> usecasesignup(SignUpEntity entity);
}
