import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_boilerplate/config/flavor_config.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'app.dart';
import 'localization/localization.dart';
import 'utils/bloc_observer.dart';
import 'utils/multi_bloc_provider.dart';
import 'utils/translations.dart';

Future<void> mainCommon() async {
  final localizationDelegate = await LocalizationDelegate.create(
    fallbackLocale: fallbackLocale,
    supportedLocales: supportLocales,
    preferences: TranslatePreferences(),
  );

  if (FlavorConfig.isDevelopment) {
    Bloc.observer = AppBlocObserver();
  }

  runApp(
    Phoenix(
      child: LocalizedApp(
        localizationDelegate,
        provideMultiBloc(MyApp()),
      ),
    ),
  );
}
