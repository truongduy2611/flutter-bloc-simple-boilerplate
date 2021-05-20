// import 'package:awste_app/global_blocs/theme/theme.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui_helpers.dart';

const fontFamily = 'Quicksand';

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    button: base.button?.copyWith(fontFamily: fontFamily),
    overline: base.overline?.copyWith(fontFamily: fontFamily),
    caption: base.caption?.copyWith(fontFamily: fontFamily),
    headline1: base.headline1?.copyWith(fontFamily: fontFamily),
    headline2: base.headline2?.copyWith(fontFamily: fontFamily),
    headline3: base.headline3?.copyWith(fontFamily: fontFamily),
    headline4: base.headline4?.copyWith(fontFamily: fontFamily),
    headline5: base.headline5?.copyWith(fontFamily: fontFamily),
    headline6: base.headline6?.copyWith(fontFamily: fontFamily),
    bodyText2: base.bodyText2?.copyWith(fontFamily: fontFamily),
    bodyText1: base.bodyText1?.copyWith(fontFamily: fontFamily),
    subtitle2: base.subtitle2?.copyWith(fontFamily: fontFamily),
    subtitle1: base.subtitle1?.copyWith(fontFamily: fontFamily),
  );
}

ThemeData buildTheme({
  required ThemeMode mode,
  required MaterialColor mainColor,
  Color? primaryColor,
  Color? primaryColorDark,
  bool useAdaptiveFontSystem = false,
}) {
  final accentColor = mainColor[200];
  final isDark = mode == ThemeMode.dark;
  ThemeData baseTheme = isDark
      ? ThemeData(
          brightness: Brightness.dark,
          accentColor: accentColor,
          toggleableActiveColor: accentColor,
          primaryColorLight: accentColor,
          primaryColor: primaryColor ?? Colors.grey[900],
          // fontFamily: fontFamily,
          errorColor: Colors.redAccent[100],
          appBarTheme: AppBarTheme(
              color: Colors.grey[800], brightness: Brightness.light),
        )
      : ThemeData(
          brightness: Brightness.light,
          primarySwatch: mainColor,
          accentColor: mainColor,
          primaryColor: primaryColor ?? mainColor,
          // fontFamily: fontFamily,
          appBarTheme: AppBarTheme(
            color: mainColor,
            brightness:
                ThemeData.estimateBrightnessForColor(primaryColor ?? mainColor),
          ),
          errorColor: Colors.redAccent,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: mainColor,
          ),
        );

  final inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: isDark ? baseTheme.accentColor : baseTheme.primaryColor,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
  );

  final inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    enabledBorder: inputBorder,
    border: inputBorder,
    errorBorder: inputBorder.copyWith(
      borderSide: inputBorder.borderSide.copyWith(
        color: baseTheme.errorColor,
      ),
    ),
    focusedBorder: inputBorder.copyWith(
      borderSide: inputBorder.borderSide.copyWith(
        width: 2,
      ),
    ),
  );

  baseTheme = baseTheme.copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    }),
    platform: (Platform.isIOS || Platform.isMacOS)
        ? TargetPlatform.iOS
        : TargetPlatform.android,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: baseTheme.buttonTheme.copyWith(
      shape: const StadiumBorder(),
    ),
    // cursorColor: mainColor[300],
    dialogTheme: baseTheme.dialogTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing),
      ),
    ),
  );
  if (useAdaptiveFontSystem) {
    return baseTheme;
  } else {
    return baseTheme.copyWith(
      textTheme: _buildTextTheme(baseTheme.textTheme),
      primaryTextTheme: _buildTextTheme(baseTheme.primaryTextTheme),
      accentTextTheme: _buildTextTheme(baseTheme.accentTextTheme),
    );
  }
}
