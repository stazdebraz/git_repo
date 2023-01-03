import 'package:dio/dio.dart';
import 'package:test_app/src/api/api_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://mocki.io/v1/7bd98b14-1578-485b-a5de-9b3ed7ffe5b2',
        sendTimeout: 15000,
        connectTimeout: 15000,
        receiveTimeout: 15000),
  );

  Future<ApiModel> getData() async {
    final response = await _dio.get('');
    return ApiModel.fromJson(response.data);
  }
}
