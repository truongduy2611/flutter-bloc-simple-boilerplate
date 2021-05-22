import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'common/widgets/widgets.dart';
import 'global_blocs/theme/theme.dart';
import 'router/route_generator.dart';
import 'router/routes.dart';
import 'utils/theme_helpers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        title: 'Flutter Bloc Simple Boilerplate',
        theme: buildTheme(
          mode: ThemeMode.light,
          mainColor: Colors.blue,
          useAdaptiveFontSystem: state.useAdaptiveFontSystem,
        ),
        darkTheme: buildTheme(
          mode: ThemeMode.dark,
          mainColor: Colors.blue,
          useAdaptiveFontSystem: state.useAdaptiveFontSystem,
        ),
        themeMode: state.mode,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        builder: networkStatusBuilder,
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        localizationsDelegates: [
          localizationDelegate,
          GlobalWidgetsLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
          ...GlobalCupertinoLocalizations.delegates,
        ],
      );
    });
  }
}
