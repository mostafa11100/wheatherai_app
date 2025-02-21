import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/home/app_home/data/model/model_getwheather.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';

abstract class BaseGetWeahterRepo {
  //
  Future<Either<Failure, GetCurrentEntity>> getweahter(ModelGetwheather model);
}
