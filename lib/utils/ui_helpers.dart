import 'package:flutter/material.dart';

const spacing = 8.0;

enum DisplayType {
  desktop,
  mobile,
}

const _desktopPortraitBreakpoint = 700.0;
const _desktopLandscapeBreakpoint = 1000.0;

/// Returns the [DisplayType] for the current screen. This app only supports
/// mobile and desktop layouts, and as such we only have one breakpoint.
DisplayType displayTypeOf(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  final width = MediaQuery.of(context).size.width;

  if ((orientation == Orientation.landscape &&
          width > _desktopLandscapeBreakpoint) ||
      (orientation == Orientation.portrait &&
          width > _desktopPortraitBreakpoint)) {
    return DisplayType.desktop;
  } else {
    return DisplayType.mobile;
  }
}

/// Returns a boolean if we are in a display of [DisplayType.desktop]. Used to
/// build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) {
  return displayTypeOf(context) == DisplayType.desktop;
}

/// Returns a boolean if we are in a display of [DisplayType.desktop] but less
/// than [_desktopLandscapeBreakpoint] width. Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return isDisplayDesktop(context) &&
      MediaQuery.of(context).size.width > _desktopLandscapeBreakpoint;
}

/// Returns textColor on a background color
Color textColorOn(Color color) {
  final brightness = ThemeData.estimateBrightnessForColor(color);
  return brightness == Brightness.light ? Colors.black : Colors.white;
}

int _numberOfColumns(double width) {
  if (width < 600) {
    return 4;
  }
  if (width < 840) {
    return 8;
  }

  if (width <= 1280) {
    return 12;
  }

  return 16;
}

int adaptiveColumns({double sm = 4, BuildContext context}) {
  final media = MediaQuery.of(context);
  final int numberOfColumns =
      _numberOfColumns(media.size.width - media.viewPadding.horizontal);
  return numberOfColumns ~/ sm;
}

double gutter(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 720) {
    return spacing * 2;
  }

  if (isDisplaySmallDesktop(context)) {
    return spacing * 4;
  }

  return spacing * 3;
}

double adaptiveWidth({int columns, BuildContext context}) {
  final size = MediaQuery.of(context).size;
  final gutterSize = gutter(context);
  return (size.width - (gutterSize * columns + 1)) /
      _numberOfColumns(size.width) *
      columns;
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get headline1 => textTheme.headline1;
  TextStyle get headline2 => textTheme.headline2;
  TextStyle get headline3 => textTheme.headline3;
  TextStyle get headline4 => textTheme.headline4;
  TextStyle get headline5 => textTheme.headline5;
  TextStyle get headline6 => textTheme.headline6;
  TextStyle get bodyText1 => textTheme.bodyText1;
  TextStyle get bodyText2 => textTheme.bodyText2;
  TextStyle get buttonTextTheme => textTheme.button;
  TextStyle get captionTextTheme => textTheme.caption;
  Brightness get brightness => theme.brightness;
}
