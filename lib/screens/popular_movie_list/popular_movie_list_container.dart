part of 'popular_movie_list.dart';

class PopularMovieListContainer extends StatelessWidget {
  const PopularMovieListContainer({Key key}) : super(key: key);

  Widget _buildMovieList(BuildContext context) {
    return BlocBuilder<PopularMovieBloc, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieLoaded) {
          return SliverPadding(
            padding: const EdgeInsets.all(spacing),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: spacing),
                    child: MovieCard(
                      movie: state.popularMovieList[i],
                    ),
                  );
                },
                childCount: state.popularMovieList.length,
              ),
            ),
          );
        }
        if (state is PopularMovieFailure) {
          return const SliverFillRemaining(
            child: ErrorContainer(),
          );
        }

        return const SliverFillRemaining(
          child: LoadingContainer(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void _onRefresh() {
      BlocProvider.of<PopularMovieBloc>(context)
          .add(RefreshPopularMovieListEvent());
    }

    void _onLoading() {
      BlocProvider.of<PopularMovieBloc>(context)
          .add(FetchPopularMovieListEvent());
    }

    return Scaffold(
      body: SmartRefresher(
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        footer: const LoadingFooter(),
        enablePullUp: true,
        controller:
            BlocProvider.of<PopularMovieBloc>(context).refreshController,
        child: CustomScrollView(
          slivers: [
            _buildMovieList(context),
          ],
        ),
      ),
    );
  }
}
