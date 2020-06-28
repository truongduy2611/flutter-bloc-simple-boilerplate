import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple_boilerplate/common/widgets/widgets.dart';
import 'package:flutter_bloc_simple_boilerplate/localization/keys.dart';
import 'package:flutter_bloc_simple_boilerplate/screens/home/home.dart';
import 'package:flutter_bloc_simple_boilerplate/screens/login/login.dart';
import 'package:flutter_bloc_simple_boilerplate/screens/settings/settings.dart';
import 'package:flutter_bloc_simple_boilerplate/screens/splash/splash.dart';

import 'routes.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return createRoute(
          child: const SplashPage(),
          isFullscreenDialog: true,
        );

      case Routes.login:
        return createRoute(
          child: const LoginPage(),
          isFullscreenDialog: true,
        );

      case Routes.home:
        return createRoute(child: const HomePage());

      case Routes.settings:
        return createRoute(child: const SettingsPage());

      default:
        break;
    }
    return _errorRoute();
  }

  static Route<dynamic> createRoute({
    Widget child,
    bool isFullscreenDialog = false,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => child,
      fullscreenDialog: isFullscreenDialog,
    );
  }

  static Route<dynamic> _errorRoute() {
    return createRoute(
      child: Scaffold(
        appBar: AppBar(),
        body: const ErrorContainer(
          messageId: Keys.not_found_page,
          icon: Icon(Icons.find_in_page),
        ),
      ),
    );
  }
}
