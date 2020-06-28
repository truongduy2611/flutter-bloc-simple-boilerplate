part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState {
  final List<MovieModel> popularMovieList;
  final int page;

  PopularMovieLoaded({this.popularMovieList, this.page = 1});

  @override
  List<Object> get props => [popularMovieList, page];
}

class PopularMovieFailure extends PopularMovieState {
  final String message;

  PopularMovieFailure(this.message);
}
