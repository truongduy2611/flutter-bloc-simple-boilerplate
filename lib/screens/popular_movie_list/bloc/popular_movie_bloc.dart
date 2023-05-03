import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_simple_boilerplate/models/movie.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/data_response.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/movie/movie_repository.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final MovieRepository movieRepository;
  final RefreshController refreshController;

  PopularMovieBloc({
    required this.movieRepository,
    required this.refreshController,
  }) : super(PopularMovieInitial()) {
    on<FetchPopularMovieListEvent>((event, emit) async {
      final currentState = state;
      List<MovieModel> movieList = <MovieModel>[];
      int page = 1;

      if (currentState is PopularMovieLoaded) {
        page = currentState.page + 1;
        movieList = currentState.popularMovieList;
      }

      final response = await movieRepository.api.fetchPopularMovies(page);

      if (response.status == Status.Success) {
        emit(PopularMovieLoaded(page: page, popularMovieList: [
          ...movieList,
          ...response.data,
        ]));

        if (response.data.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } else {
        if (currentState is! PopularMovieLoaded) {
          emit(PopularMovieFailure(response.message));
        }
        refreshController.loadFailed();
      }
    });

    on<RefreshPopularMovieListEvent>(
      (event, emit) async {
        final response = await movieRepository.api.fetchPopularMovies(1);
        refreshController.resetNoData();

        if (response.status == Status.Success) {
          emit(PopularMovieLoaded(
            page: 1,
            popularMovieList: response.data,
          ));

          refreshController.refreshCompleted();
        } else {
          emit(PopularMovieFailure(response.message));
          refreshController.refreshFailed();
        }
      },
    );
  }
}
