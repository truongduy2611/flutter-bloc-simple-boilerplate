part of 'movie_detail.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(
        movieId: movie.id!,
        movieRepository: RepositoryProvider.of<MovieRepository>(context),
      )..add(FetchMovieDetailEvent()),
      child: MovieDetailContainer(movie: movie),
    );
  }
}
