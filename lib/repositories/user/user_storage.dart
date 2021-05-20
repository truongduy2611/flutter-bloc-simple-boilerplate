part of 'user_repository.dart';

class UserStorage {
  UserStorage._();

  String? token;

  bool get hasToken => token != null;

  static late final UserStorage _instance = UserStorage._();

  static UserStorage get instance => _instance;

  Future<bool> saveToken(String token) async {
    bool success = false;

    try {
      final sharePrefInstance = await SharedPreferences.getInstance();
      success = await sharePrefInstance.setString('TOKEN', token);
      print('saveToken $success');
    } catch (e) {
      print(e);
    }

    if (success) {
      instance.token = token;
    }

    return success;
  }

  Future<String?> getToken() async {
    if (!instance.hasToken) {
      try {
        final sharePrefInstance = await SharedPreferences.getInstance();
        instance.token = sharePrefInstance.getString('TOKEN');
        return instance.token;
      } catch (e) {
        print(e);
      }
    }

    return instance.token;
  }

  Future<bool> deleteToken() async {
    try {
      final sharePrefInstance = await SharedPreferences.getInstance();
      instance.token = null;
      return await sharePrefInstance.remove('TOKEN');
    } catch (e) {
      instance.token = null;
    }
    return false;
  }
}
