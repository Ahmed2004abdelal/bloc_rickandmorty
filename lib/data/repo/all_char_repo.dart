import 'package:bloc_breaking/data/API/api_error.dart';
import 'package:bloc_breaking/data/API/api_msg.dart';
import 'package:bloc_breaking/data/API/api_services.dart';
import 'package:bloc_breaking/data/model/characters_model.dart';
import 'package:dio/dio.dart';

class AllCharRepo {
  final ApiServices _apiServices = ApiServices();

  ///get all characters
  Future<List<CharactersModel>> getAllCharacters() async {
    try {
      final res = await _apiServices.getData('character');
      if (res != null && res is! ApiMsg) {
        final List<dynamic> results = res['results'];
        return results
            .map(
              (character) =>
                  CharactersModel.fromJson(character as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw ApiMsg(msg: res.toString());
      }
    } on DioException catch (e) {
      throw ApiError.handleError(e);
    } catch (e) {
      throw ApiMsg(msg: e.toString());
    }
  }
}
