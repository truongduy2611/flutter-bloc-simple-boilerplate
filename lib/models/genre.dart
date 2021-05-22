import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class GenreModel extends Equatable {
  final int? id;
  final String? name;

  const GenreModel({
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return _$GenreModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
