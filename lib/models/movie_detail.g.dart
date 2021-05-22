// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) {
  return MovieDetailModel(
    backdropPath: json['backdrop_path'] as String?,
    posterPath: json['poster_path'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
    releaseDate: json['release_date'] as String?,
    overview: json['overview'] as String?,
    title: json['title'] as String?,
    id: json['id'] as int?,
    originalTitle: json['original_title'] as String?,
    revenue: json['revenue'] as int?,
    genres: (json['genres'] as List<dynamic>?)
        ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieDetailModelToJson(MovieDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'revenue': instance.revenue,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
      'genres': instance.genres,
    };
