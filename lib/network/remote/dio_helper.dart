import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://gnews.io/api/",
        receiveDataWhenStatusError: true,
        headers: {},
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio.get(url, queryParameters: query);
      return response;
    } on DioException catch (error) {
      debugPrint("Error occurred: ${error.message}");
      rethrow;
    }
  }
}
