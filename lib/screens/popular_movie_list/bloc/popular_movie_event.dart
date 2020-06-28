part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieEvent {}

class RefreshPopularMovieListEvent extends PopularMovieEvent {}

class FetchPopularMovieListEvent extends PopularMovieEvent {}
