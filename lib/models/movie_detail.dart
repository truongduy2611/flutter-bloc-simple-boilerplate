import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_simple_boilerplate/models/genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetailModel extends Equatable {
  final int? id;
  final String? title;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  final int? revenue;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  final String? overview;

  final List<GenreModel>? genres;

  const MovieDetailModel({
    this.backdropPath,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.overview,
    this.title,
    this.id,
    this.originalTitle,
    this.revenue,
    this.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [
        backdropPath,
        posterPath,
        voteAverage,
        voteCount,
        releaseDate,
        overview,
        title,
        id,
        originalTitle,
        genres,
        revenue,
      ];

  String get poster =>
      'https://image.tmdb.org/t/p/w440_and_h660_face$posterPath';
}
