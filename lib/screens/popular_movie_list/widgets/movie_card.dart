part of '../popular_movie_list.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key key, this.movie}) : super(key: key);
  final MovieModel movie;

  static String getImageUrl(String imageUrl) {
    return 'https://image.tmdb.org/t/p/w440_and_h660_face$imageUrl';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(spacing),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage.network(
              getImageUrl(movie.posterPath),
              height: 120,
              width: 80,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
