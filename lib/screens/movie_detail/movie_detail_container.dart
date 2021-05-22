part of 'movie_detail.dart';

class MovieDetailContainer extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailContainer({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MovieDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SmartRefresher(
        onRefresh: () {
          bloc.add(FetchMovieDetailEvent());
        },
        controller: bloc.refreshController,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
          if (state is MovieDetailLoaded) {
            final movie = state.data;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(spacing * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImage.network(
                        movie.poster,
                        height: 220,
                        width: 146,
                      ),
                      const SizedBox(width: spacing * 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              movie.title ?? '',
                              style: context.headline6,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              movie.overview ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: spacing),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: spacing * 2,
                                    ),
                                  ),
                                  TextSpan(
                                      text:
                                          ' ${movie.voteAverage} (${movie.voteCount}) • ${movie.releaseDate}'),
                                ],
                              ),
                            ),
                            if (movie.genres?.isNotEmpty == true)
                              Wrap(
                                alignment: WrapAlignment.start,
                                runSpacing: -spacing / 2,
                                spacing: spacing / 2,
                                children: movie.genres!
                                    .map((o) => Chip(label: Text(o.name!)))
                                    .toList(),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }

          if (state is MovieDetailError) {
            return Center(
              child: ErrorContainer(
                messageId: state.message ?? '',
              ),
            );
          }

          return const Center(
            child: SizedBox(
              height: spacing * 2,
              width: spacing * 2,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        }),
      ),
    );
  }
}
