// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';
import 'package:wheater_app/core/network/apis/api_config.dart';
import 'package:wheater_app/core/utilis/api_baselink.dart';
import 'package:wheater_app/core/utilis/api_keys.dart';
import 'package:wheater_app/futures/home/app_home/data/model/forecastemodel.dart';
import 'package:wheater_app/futures/home/app_home/data/model/model_getwheather.dart';

abstract class BaseRemoteWheather {
  Future<WeatheResponse> getdata({required ModelGetwheather requestmodel});
  adddata();
}

class RemoteWheather extends BaseRemoteWheather {
  late ApiDio _dio;
  @override
  Future<WeatheResponse> getdata({
    required ModelGetwheather requestmodel,
  }) async {
    Map<String, dynamic> pr = {"key": apikey};
    pr.addAll(requestmodel.tojson());

    _dio = ApiDio.getinstance();
    Response result = await _dio.get(
      data: pr,
      url: requestmodel.days == 0 ? currentapi : forceast,
    );
    WeatheResponse weatherCurrentResponse = WeatheResponse.fromJson(
      result.data,
    );

    return weatherCurrentResponse;
  }

  @override
  adddata() {
    throw UnimplementedError();
  }
}
