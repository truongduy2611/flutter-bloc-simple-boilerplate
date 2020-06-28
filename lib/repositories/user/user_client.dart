part of 'user_repository.dart';

class _UserApiClient {
  Future<DataResponse<Map<String, dynamic>>> login(
      Map<String, dynamic> payload) async {
    final request = ApiClients.getApiClient().post(
      '/account/sign-in',
      data: payload,
    );

    return await makeRequest<Map<String, dynamic>>(request);
  }
}
