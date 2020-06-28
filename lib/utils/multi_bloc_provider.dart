import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_boilerplate/global_blocs/global_blocs.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/movie/movie_repository.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/repositories.dart';

Widget provideMultiBloc(Widget child) {
  final bloc = MultiBlocProvider(providers: [
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
    ),
    BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      )..add(AppStartedEvent()),
    ),
    BlocProvider(
      create: (context) => AlertBloc(),
    ),
  ], child: child);

  return MultiRepositoryProvider(providers: [
    RepositoryProvider(
      create: (context) => UserRepository(),
    ),
    RepositoryProvider(
      create: (context) => MovieRepository(),
    ),
  ], child: bloc);
}
