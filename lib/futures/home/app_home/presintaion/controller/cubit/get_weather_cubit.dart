// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';
import 'package:wheater_app/futures/home/app_home/domain/usecases/getweather_usecase.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  final UseCaseGetWeather _getWeatheruseecase;
  GetWeatherCubit(this._getWeatheruseecase) : super(GetWeatherInitial());

  factory GetWeatherCubit.blocprovider(context) {
    return BlocProvider.of<GetWeatherCubit>(context);
  }

  get({alerts, aqi, days}) async {
    try {
      emit(GetWeatherLoading());
      Either<Failure, GetCurrentEntity> result = await _getWeatheruseecase
          .getweather(days: days, alerts: alerts, aqi: aqi);
      result.fold(
        (left) {
          emit(GetWeatherFail(left.error!));
        },
        (right) {
          emit(GetWeatherSuccess(right));
        },
      );
    } catch (e) {
      emit(GetWeatherFail(Failure.fromjson(e.toString()).error!));
    }
  }
}
