import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';

abstract class BaseAiModelRepo<Tresponsemodel> {
  Future<Either<Failure, GetCurrentEntity>>? create({GetCurrentEntity entity});
}
