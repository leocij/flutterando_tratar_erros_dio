import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print('REQUEST[${options.method}] >>> PATH: ${options.path}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    // 200
    // 201
    print('REQUEST[${response.statusCode}] >>> PATH: ${response.request.path}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('REQUEST[${err.response.statusCode}] >>> PATH: ${err.response.request.path}');
    return super.onError(err);
  }
}