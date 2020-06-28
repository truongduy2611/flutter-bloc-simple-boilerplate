// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    backdropPath: json['backdrop_path'] as String,
    posterPath: json['poster_path'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
    releaseDate: json['release_date'] as String,
    overview: json['overview'] as String,
    title: json['title'] as String,
    id: json['id'] as int,
    originalTitle: json['original_title'] as String,
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
    };
