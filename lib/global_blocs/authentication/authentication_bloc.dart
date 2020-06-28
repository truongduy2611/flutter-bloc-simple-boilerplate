part of 'authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      final token = await userRepository.storage.getToken();
      print(token);
      if (token != null) {
        try {
          final payload = Jwt.parseJwt(token);
          final exp = payload['exp'] as int;
          if (exp < DateTime.now().millisecondsSinceEpoch ~/ 1000) {
            await userRepository.storage.deleteToken();
            yield AuthenticationUnauthenticated();
          } else {
            yield AuthenticationAuthenticated(const User(id: 1));
          }
        } catch (e) {
          print(e);
          yield AuthenticationUnauthenticated();
        }
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is SetUserEvent) {
      yield AuthenticationAuthenticated(event.user);
    }

    if (event is LogOutEvent) {
      await userRepository.storage.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
