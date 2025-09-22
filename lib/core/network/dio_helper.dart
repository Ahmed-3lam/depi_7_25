import 'dart:developer';

import 'package:depi_7_25/core/helpers/hive_helper.dart';
import 'package:depi_7_25/core/network/kapis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static late Dio _dio;
  static String? token = HiveHelper.getToken();

  static void initialized() {
    _dio =
        Dio(
            BaseOptions(
              baseUrl: KApis.baseUrl,
              connectTimeout: Duration(seconds: 30),
              sendTimeout: Duration(seconds: 30),
              receiveTimeout: Duration(seconds: 30),
              headers: {
                "Content-Type": "application/json",
                "Accept-Language": "en",
                if (token != null) "Authorization": "Bearer $token",
              },
            ),
          )
          ..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              error: true,
              compact: true,
              maxWidth: 90,
              enabled: kDebugMode,
              filter: (options, args) {
            
                return !args.isResponse || !args.hasUint8ListData;
              },
            ),
          );
  }

  static void addTokenInterceptor() {
    token = HiveHelper.getToken();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (token != null) {
            options.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }

  static Future<Response<dynamic>> getData(String path) async {
    final response = await _dio.get(path);

    return response;
  }

  static Future<Response<dynamic>> postData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return response;
  }
}
