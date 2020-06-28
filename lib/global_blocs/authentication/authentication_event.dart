part of 'authentication.dart';

@immutable
abstract class AuthenticationEvent {}

class SetUserEvent extends AuthenticationEvent {
  final User user;

  SetUserEvent(this.user);
}

class LogOutEvent extends AuthenticationEvent {}

class AppStartedEvent extends AuthenticationEvent {}

class OnLoginSuccessEvent extends AuthenticationEvent {
  final String token;

  OnLoginSuccessEvent(this.token);
}
