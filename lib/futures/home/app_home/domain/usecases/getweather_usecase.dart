import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/futures/home/app_home/data/model/model_getwheather.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';
import 'package:wheater_app/futures/home/app_home/domain/interfaces/aimodel_interface.dart';
import 'package:wheater_app/futures/home/app_home/domain/interfaces/getwheatherrepo.dart';

class UseCaseGetWeather {
  BaseGetWeahterRepo repogetw;
  BaseAiModelRepo<GetCurrentEntity> airepo;
  UseCaseGetWeather(this.repogetw, this.airepo);
  Future<Either<Failure, GetCurrentEntity>> getweather({
    alerts,
    aqi,
    days,
  }) async {
    try {
      Either<Failure, GetCurrentEntity> result;
      String? lang = await sl<Cashhelper>().getlanguage() ?? 'ar';

      String? location = await sl<Cashhelper>().getlocation() ?? 'cairo';

      result = await repogetw.getweahter(
        ModelGetwheather(
          language: lang,
          location: location,
          alerts: alerts,
          aqi: aqi,
          days: days,
        ),
      );

      await result.fold(
        (left) {
          result = Left(left);
        },
        (right) async {
          Either<Failure, GetCurrentEntity>? airesult = await airepo.create(
            entity: right,
          );

          result = airesult!;
        },
      );

      return result;
    } catch (e) {
      return Left(Failure.fromjson(e.toString()));
    }
  }
}
