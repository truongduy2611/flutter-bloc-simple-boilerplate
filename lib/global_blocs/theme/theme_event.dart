part of 'theme.dart';

abstract class ThemeEvent {}

class LoadThemeFromPrefEvent extends ThemeEvent {}

class SetThemeMode extends ThemeEvent {
  final ThemeMode mode;

  SetThemeMode(this.mode) : assert(mode != null);
}

class SetAdaptiveFontSystemEvent extends ThemeEvent {
  final bool useAdaptiveFontSystem;
  SetAdaptiveFontSystemEvent(this.useAdaptiveFontSystem);
}

class SetMainColorEvent extends ThemeEvent {
  final MaterialColor color;

  SetMainColorEvent({this.color});
}

class SetDarkMode extends ThemeEvent {
  final DarkMode mode;

  SetDarkMode(this.mode) : assert(mode != null);
}
