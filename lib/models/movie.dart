import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  final int id;
  final String title;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  final String overview;

  const MovieModel({
    this.backdropPath,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.overview,
    this.title,
    this.id,
    this.originalTitle,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props => [
        backdropPath,
        posterPath,
        voteAverage,
        voteCount,
        releaseDate,
        overview,
        title,
        id,
        originalTitle,
      ];
}
