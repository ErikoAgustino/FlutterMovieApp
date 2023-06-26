import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_app/model/credit.dart';
import 'package:movie_app/service/strings.dart';

class CreditServices {
  Future<List<Credit>?> getListCreditData(int movieId) async {
    Dio dio = Dio();
    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=${Strings.apiKey}');

      log((result.data['cast'] as List).length.toString());

      List<Credit> listData =
          (result.data['cast'] as List).map((e) => Credit.fromJson(e)).toList();

      return listData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
