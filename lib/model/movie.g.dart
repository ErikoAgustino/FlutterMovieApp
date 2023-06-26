// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      genre_ids:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      poster_path: json['poster_path'] as String,
      backdrop_path: json['backdrop_path'] as String?,
      release_date: json['release_date'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      vote_average: (json['vote_average'] as num).toDouble(),
      vote_count: json['vote_count'] as int,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'genre_ids': instance.genre_ids,
      'poster_path': instance.poster_path,
      'backdrop_path': instance.backdrop_path,
      'release_date': instance.release_date,
      'popularity': instance.popularity,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
