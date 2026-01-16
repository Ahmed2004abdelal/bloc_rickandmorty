import 'package:bloc_breaking/data/API/api_error.dart';
import 'package:bloc_breaking/data/API/api_msg.dart';
import 'package:bloc_breaking/data/API/dio_client.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final DioClient _dioClient = DioClient();

  ///Get
  Future<dynamic> getData(String endPoint) async {
    try {
      final res = await _dioClient.dio.get(endPoint);
      return res.data;
    } on DioException catch (e) {
      return ApiError.handleError(e);
    } catch (e) {
      return ApiMsg(msg: e.toString());
    }
  }
}
