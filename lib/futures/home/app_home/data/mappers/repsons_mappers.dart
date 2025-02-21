import 'package:wheater_app/futures/home/app_home/data/model/forecastemodel.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';

extension WeatherModelMapper on WeatheResponse {
  GetCurrentEntity toEntity() {
    return GetCurrentEntity(
      cityName: location?.name ?? "Un Known",
      temperature: forecast!.forecastday!.last.day!.avgtempC! ?? 0.0,
      conditionText:
          forecast!.forecastday!.last.day!.condition?.text ?? "Un Known",
      conditionIcon: "https:${current?.condition?.icon ?? ""}",
      windSpeed: forecast!.forecastday!.last.day!.maxwindKph ?? 0.0,
      humidity: forecast!.forecastday!.last.day!.avghumidity ?? 0,
      cloudiness: current?.cloud ?? 0,
      visibility: (forecast!.forecastday!.last.day!.avgvisKm ?? 0.0).toDouble(),
      lastUpdated: current?.lastUpdated ?? "Un Known",
    );
  }
}
