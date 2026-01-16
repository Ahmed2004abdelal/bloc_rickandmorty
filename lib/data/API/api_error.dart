import 'package:bloc_breaking/data/API/api_msg.dart';
import 'package:dio/dio.dart';

class ApiError {
  static ApiMsg handleError(DioException error) {
    final data = error.response?.data;
    if (data['error'] != null) {
      return ApiMsg(msg: data['error']);
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiMsg(msg: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ApiMsg(msg: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ApiMsg(msg: "Receive Timeout");
      case DioExceptionType.badResponse:
        return ApiMsg(msg: "Bad Response");
      case DioExceptionType.cancel:
        return ApiMsg(msg: "Request Cancelled");
      case DioExceptionType.connectionError:
        return ApiMsg(msg: "Connection Error");
      case DioExceptionType.badCertificate:
        return ApiMsg(msg: "Bad Certificate");
      case DioExceptionType.unknown:
        return ApiMsg(msg: "Unknown Error");
    }
  }
}
