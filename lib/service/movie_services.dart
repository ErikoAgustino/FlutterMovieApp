import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/service/strings.dart';

class MovieServices {
  Future<List<Movie>?> getNowPlayingMovieData(int page, String language) async {
    Dio dio = Dio();

    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=${Strings.apiKey}&language=$language&page=$page');

      log((result.data['results'] as List).length.toString());

      List<Movie> listData = (result.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();

      return listData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List<Movie>?> getUpcomingMovieData(int page, String language) async {
    Dio dio = Dio();

    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=${Strings.apiKey}&language=$language&page=$page');

      log((result.data['results'] as List).length.toString());
      List<Movie> listData = (result.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();

      return listData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Movie?> getMovieData(int movieId) async {
    Dio dio = Dio();

    try {
      var result = await dio.get(
          'https://api.themoviedb.org/3/movie/$movieId?api_key=${Strings.apiKey}');

      log(result.data);
      Movie movieData = Movie.fromJson(result.data);

      return movieData;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
