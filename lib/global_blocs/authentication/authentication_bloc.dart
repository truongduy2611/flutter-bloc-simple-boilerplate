part of 'authentication.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository}) : super(AuthenticationInitial()) {
    on<AppStartedEvent>((event, emit) async {
      final token = await userRepository.storage.getToken();
      print(token);
      if (token != null) {
        try {
          final payload = Jwt.parseJwt(token);
          final exp = payload['exp'] as int;
          if (exp < DateTime.now().millisecondsSinceEpoch ~/ 1000) {
            await userRepository.storage.deleteToken();
            emit(AuthenticationUnauthenticated());
          } else {
            emit(AuthenticationAuthenticated(const User(id: 1)));
          }
        } catch (e) {
          print(e);
          emit(AuthenticationUnauthenticated());
        }
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<SetUserEvent>((event, emit) {
      emit(AuthenticationAuthenticated(event.user));
    });

    on<LogOutEvent>((event, emit) async {
      await userRepository.storage.deleteToken();
      emit(AuthenticationUnauthenticated());
    });
  }
}
