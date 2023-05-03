import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_boilerplate/global_blocs/global_blocs.dart';
import 'package:flutter_bloc_simple_boilerplate/models/user.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AlertBloc alertBloc;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.alertBloc,
    required this.authenticationBloc,
  }) : super(LoginInitial()) {
    on<OnPressedLoginButtonEvent>((event, emit) async {
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
    });
  }
}
