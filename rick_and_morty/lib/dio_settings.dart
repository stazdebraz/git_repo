import 'package:dio/dio.dart';

class DioSettings {
  DioSettings() {
    setup();
  }
  final Dio dio = Dio(
    BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api/',
        receiveTimeout: 15000,
        connectTimeout: 15000),
  );

  void setup() {
    final interceptors = dio.interceptors;
    interceptors.clear();

    final logInterceptor = LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    interceptors.addAll([logInterceptor]);
  }
}
