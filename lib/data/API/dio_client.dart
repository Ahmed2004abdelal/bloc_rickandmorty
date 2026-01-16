import 'package:bloc_breaking/consts/strings.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      responseType: ResponseType.json,
      followRedirects: false,
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  // DioClient() {
  //   dio.interceptors.add(
  //     LogInterceptor(
  //       // request: true,
  //       requestBody: true,
  //       responseBody: true,
  //       // responseHeader: false,
  //     ),
  //   );
  // }

  Dio get dio => _dio;
}
