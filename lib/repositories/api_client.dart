import 'package:dio/dio.dart';
import 'package:flutter_bloc_simple_boilerplate/config/flavor_config.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/user/user_repository.dart';

class ApiClients {
  ApiClients._();

  static Dio getApiClient({
    bool usePublicApi = false,
    Map<String, String>? headers,
  }) {
    return Dio()
      ..options = BaseOptions(
        baseUrl: FlavorConfig.env.baseUrl,
        headers: <String, String?>{
          if (!usePublicApi) 'Authorization': UserStorage.instance.token,
          if (headers != null) ...headers,
        },
      );
  }
}
