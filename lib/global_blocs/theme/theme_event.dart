part of 'theme.dart';

abstract class ThemeEvent {}

class LoadThemeFromPrefEvent extends ThemeEvent {}

class SetThemeMode extends ThemeEvent {
  final ThemeMode mode;

  SetThemeMode(this.mode);
}

class SetAdaptiveFontSystemEvent extends ThemeEvent {
  final bool useAdaptiveFontSystem;
  SetAdaptiveFontSystemEvent(this.useAdaptiveFontSystem);
}

class SetMainColorEvent extends ThemeEvent {
  final MaterialColor color;

  SetMainColorEvent({required this.color});
}

class SetDarkMode extends ThemeEvent {
  final DarkMode mode;

  SetDarkMode(this.mode);
}
