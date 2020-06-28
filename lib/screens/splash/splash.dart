import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_boilerplate/constants/asset.dart';
import 'package:flutter_bloc_simple_boilerplate/global_blocs/global_blocs.dart';
import 'package:flutter_bloc_simple_boilerplate/router/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) async {
        if (state is AuthenticationAuthenticated) {
          await Future.delayed(const Duration(milliseconds: 1000));
          Navigator.pushReplacementNamed(context, Routes.home);
        } else {
          await Future.delayed(const Duration(milliseconds: 1000));
          Navigator.pushReplacementNamed(context, Routes.login);
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            Assets.logoIcon,
            height: 128,
            width: 128,
          ),
        ),
      ),
    );
  }
}
