part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailModel data;

  const MovieDetailLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class MovieDetailError extends MovieDetailState {
  final String? message;

  const MovieDetailError(this.message);
}
