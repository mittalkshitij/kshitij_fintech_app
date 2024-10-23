import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio
      ..options.baseUrl =
          'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_0xTIiJf9XsmEVZYBjTx7WGLFmvLDJDqJfMGy978o&base_currency=INR'
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30);
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameter}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameter);
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path,
      {dynamic body, Options? option, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.post(path,
          data: body, options: option, cancelToken: cancelToken);
      return response;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String path,
      {dynamic body, Options? option, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.delete(path,
          data: body, options: option, cancelToken: cancelToken);
      return response;
    } on Exception catch (e) {
      rethrow;
    }
  }
}

final dioProvider = Provider((ref) => DioClient());
