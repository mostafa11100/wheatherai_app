import 'package:dio/dio.dart';

class ApiDio {
  static final ApiDio _instance = ApiDio._ins();
  //config
  late Dio dio;

  ApiDio._ins() {
    BaseOptions baseOptions = BaseOptions(receiveDataWhenStatusError: true);
    dio = Dio(baseOptions);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
      ),
    );
  }

  factory ApiDio.getinstance() {
    return _instance;
  }
  Future<Response> get({required data, url}) async {
    Response re = await dio.get(url, queryParameters: data);

    return re;
  }

  Future<Response> post({required data, url}) async {
    Response re = await dio.post(url, data: data);

    return re;
  }
}
