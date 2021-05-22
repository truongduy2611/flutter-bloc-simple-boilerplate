import 'package:flutter_bloc_simple_boilerplate/config/flavor_config.dart';
import 'package:flutter_bloc_simple_boilerplate/models/movie.dart';
import 'package:flutter_bloc_simple_boilerplate/models/movie_detail.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/data_response.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/repositories.dart';

class MovieApiClient {
  static const path = '/movie';

  Future<DataResponse<List<MovieModel>>> fetchPopularMovies(int page) async {
    final request = ApiClients.getApiClient(usePublicApi: true).get(
        '$path/top_rated?api_key=${FlavorConfig.env.apiKey}&language=en-US&page=$page');

    return await makeRequest<List<MovieModel>>(
      request,
      processCallback: (payload) {
        final results = payload['results'] as List;
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      },
    );
  }

  Future<DataResponse<MovieDetailModel>> fetchMovieDetail(int id) async {
    final request = ApiClients.getApiClient(usePublicApi: true)
        .get('$path/$id?api_key=${FlavorConfig.env.apiKey}');

    return await makeRequest<MovieDetailModel>(
      request,
      processCallback: (payload) {
        return MovieDetailModel.fromJson(payload);
      },
    );
  }
}

class MovieRepository {
  final api = MovieApiClient();
}
