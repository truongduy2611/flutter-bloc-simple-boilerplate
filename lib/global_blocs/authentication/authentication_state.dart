part of 'authentication.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  AuthenticationAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}
