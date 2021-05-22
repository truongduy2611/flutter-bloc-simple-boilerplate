import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_simple_boilerplate/models/movie_detail.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/movie/movie_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final int movieId;
  final MovieRepository movieRepository;
  final RefreshController refreshController;

  MovieDetailBloc({required this.movieId, required this.movieRepository})
      : refreshController = RefreshController(),
        super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is FetchMovieDetailEvent) {
      final response = await movieRepository.api.fetchMovieDetail(movieId);
      if (response.isSuccess) {
        yield MovieDetailLoaded(response.data);
        refreshController.refreshCompleted();
      } else {
        yield MovieDetailError(response.message);
        refreshController.refreshFailed();
      }
    }
  }
}
