import 'package:depi_7_25/core/network/kapis.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;
                  
  static void initialized() {
    _dio = Dio(
      BaseOptions(
        baseUrl: KApis.baseUrl,
        connectTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {"Content-Type": "application/json", "Accept-Language": "en"},
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
