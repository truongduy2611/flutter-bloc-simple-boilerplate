part of 'popular_movie_list.dart';

class PopularMovieListPage extends StatelessWidget {
  const PopularMovieListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularMovieBloc>(
      create: (context) => PopularMovieBloc(
        refreshController: RefreshController(),
        movieRepository: RepositoryProvider.of<MovieRepository>(context),
      )..add(FetchPopularMovieListEvent()),
      child: const PopularMovieListContainer(),
    );
  }
}
