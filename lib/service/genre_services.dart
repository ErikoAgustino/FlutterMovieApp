import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/service/strings.dart';

class GenreServices {
  Future<List<Genre>?> getListGenreData() async {
    Dio dio = Dio();
    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/genre/movie/list?api_key=${Strings.apiKey}');

      log((result.data['genres'] as List).length.toString());

      List<Genre> listData = (result.data['genres'] as List)
          .map((e) => Genre.fromJson(e))
          .toList();

      return listData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
