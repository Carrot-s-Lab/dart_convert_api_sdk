import 'dart:convert';

import 'package:dio/dio.dart';

class ConvertHttpClient {
  late final Dio _dio;

  ConvertHttpClient({
    required String apiKey,
    required String apiSecret,
  }) {
    final credentials = '$apiKey:$apiSecret';
    final encodedCredentials = base64Encode(utf8.encode(credentials));

    final options = BaseOptions(
        baseUrl: 'https://v2.convertapi.com',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(seconds: 1200),
        queryParameters: {
          'secret': apiSecret,
        },
        headers: {
          'Authorization': 'Basic $encodedCredentials',
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json'
        });

    _dio = Dio(options);
  }

  Future<Response> post({
    required String path,
    required FormData data,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
