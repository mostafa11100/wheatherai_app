// ignore_for_file: must_be_immutable

part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherLoading extends GetWeatherState {}

final class GetWeatherSuccess extends GetWeatherState {
  GetCurrentEntity entity;
  GetWeatherSuccess(this.entity);
}

final class GetWeatherFail extends GetWeatherState {
  String eror;
  GetWeatherFail(this.eror);
}
