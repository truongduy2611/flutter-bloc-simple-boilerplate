import 'dart:async';

import 'package:flutter_bloc_simple_boilerplate/global_blocs/global_blocs.dart';
import 'package:flutter_bloc_simple_boilerplate/models/user.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AlertBloc alertBloc;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    this.userRepository,
    this.alertBloc,
    this.authenticationBloc,
  });

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnPressedLoginButtonEvent) {
      alertBloc.add(ShowAlertEvent.loading());
      // final response = await userRepository.api.login(event.payload);
      // print(response.data);
      // if (response.status == Status.Success) {
      //   await userRepository.storage.saveToken(response.data['token']);
      await Future.delayed(const Duration(seconds: 1));
      authenticationBloc.add(SetUserEvent(const User(id: 1)));
      alertBloc.add(HideAlertEvent());
      // } else {
      //   alertBloc.add(ShowAlert(content: response.message));
      // }
    }
  }
}
