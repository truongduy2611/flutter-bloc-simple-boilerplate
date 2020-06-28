import 'package:shared_preferences/shared_preferences.dart';
import '../api_client.dart';
import '../data_response.dart';

part 'user_storage.dart';
part 'user_client.dart';

class UserRepository {
  final UserStorage storage = UserStorage.instance;
  final _UserApiClient api = _UserApiClient();
}
