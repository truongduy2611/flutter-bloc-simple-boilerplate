part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnPressedLoginButtonEvent extends LoginEvent {
  final Map<String, dynamic> payload;

  OnPressedLoginButtonEvent(this.payload);
}
