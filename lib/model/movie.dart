import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie(
      {required int id,
      required String title,
      required String overview,
      // ignore: non_constant_identifier_names
      required List<int> genre_ids,
      // ignore: non_constant_identifier_names
      required String poster_path,
      // ignore: non_constant_identifier_names
      required String? backdrop_path, // bisa null
      // ignore: non_constant_identifier_names
      required String release_date,
      required double popularity,
      // ignore: non_constant_identifier_names
      required double vote_average,
      // ignore: non_constant_identifier_names
      required int vote_count}) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
