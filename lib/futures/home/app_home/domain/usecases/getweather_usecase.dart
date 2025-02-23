import 'package:dartz/dartz.dart';
import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/futures/home/app_home/data/model/model_getwheather.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';
import 'package:wheater_app/futures/home/app_home/domain/interfaces/getwheatherrepo.dart';

class UseCaseGetWeather {
  BaseGetWeahterRepo repogetw;
  UseCaseGetWeather(this.repogetw);
  Future<Either<Failure, GetCurrentEntity>> getweather({
    alerts,
    aqi,
    days,
  }) async {
    try {
      String? lang = await sl<Cashhelper>().getlanguage() ?? 'ar';

      String? location = await sl<Cashhelper>().getlocation() ?? 'cairo';

      Either<Failure, GetCurrentEntity> result = await repogetw.getweahter(
        ModelGetwheather(
          language: lang,
          location: location,
          alerts: alerts,
          aqi: aqi,
          days: days,
        ),
      );
      return result;
    } catch (e) {
      return Left(Failure.fromjson(e.toString()));
    }
  }
}
