import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/home/app_home/data/mappers/repsons_mappers.dart';
import 'package:wheater_app/futures/home/app_home/data/model/forecastemodel.dart';
import 'package:wheater_app/futures/home/app_home/data/model/model_getwheather.dart';
import 'package:wheater_app/futures/home/app_home/data/remote_data/api_wheather_remot.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';
import 'package:wheater_app/futures/home/app_home/domain/interfaces/getwheatherrepo.dart';

class GetWeatherRepoimp extends BaseGetWeahterRepo {
  final BaseRemoteWheather _baseRemoteWheather;
  GetWeatherRepoimp(this._baseRemoteWheather);
  @override
  Future<Either<Failure, GetCurrentEntity>> getweahter(
    ModelGetwheather model,
  ) async {
    try {
      WeatheResponse currentmodel = await _baseRemoteWheather.getdata(
        requestmodel: model,
      );

      GetCurrentEntity entity = currentmodel.toEntity();

      return Right(entity);
    } on DioException catch (e) {
      return Left(Failure.handleHttpError(e.response!.statusCode));
    } catch (e) {
      return Left(Failure.fromjson(e.toString()));
    }
  }
}
