import 'package:dio/dio.dart';
import 'package:tratar_erros_dio/src/shared/constants.dart';
import 'package:tratar_erros_dio/src/shared/custom_dio/interceptors.dart';

class CustomDio {
  Dio dio = new Dio();
  CustomDio() {
    dio.options.baseUrl = BASE_URL;
    dio.interceptors.add(CustomInterceptors());
    dio.options.connectTimeout = 5000;
  }
}
