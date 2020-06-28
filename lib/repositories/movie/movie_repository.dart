import 'package:flutter_bloc_simple_boilerplate/models/movie.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/data_response.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/repositories.dart';

class MovieApiClient {
  static const apiKey = '7d1053fff77e5cfb9c858cb285cecc19';
  static const path = '/movie';

  Future<DataResponse<List<MovieModel>>> fetchPopularMovies(int page) async {
    final request = ApiClients.getApiClient(usePublicApi: true)
        .get('$path/top_rated?api_key=$apiKey&language=en-US&page=$page');

    return await makeRequest<List<MovieModel>>(
      request,
      processCallback: (payload) {
        final results = payload['results'] as List;
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      },
    );
  }
}

class MovieRepository {
  final api = MovieApiClient();
}
