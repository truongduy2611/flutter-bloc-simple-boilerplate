import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'theme_state.g.dart';

enum DarkMode { trueDark, dark }

Map<String, MaterialColor> _colors = {
  for (final color in Colors.primaries) color.toString(): color
};

MaterialColor _mainColorFromJson(Map<String, dynamic> input) {
  return _colors[input['color'] ?? ''] ?? Colors.blue;
}

Map<String, dynamic> _mainColorToJson(MaterialColor color) {
  return <String, dynamic>{
    'color': color.toString(),
  };
}

@JsonSerializable()
class ThemeState extends Equatable {
  final ThemeMode mode;
  final DarkMode darkMode;
  final bool useAdaptiveFontSystem;

  @JsonKey(fromJson: _mainColorFromJson, toJson: _mainColorToJson)
  final MaterialColor mainColor;

  const ThemeState({
    this.mode = ThemeMode.system,
    this.darkMode = DarkMode.dark,
    this.useAdaptiveFontSystem = false,
    this.mainColor = Colors.blue,
  });

  const ThemeState.light()
      : mode = ThemeMode.light,
        darkMode = DarkMode.dark,
        useAdaptiveFontSystem = false,
        mainColor = Colors.blue;

  const ThemeState.system()
      : mode = ThemeMode.system,
        darkMode = DarkMode.dark,
        useAdaptiveFontSystem = false,
        mainColor = Colors.blue;

  const ThemeState.dark()
      : mode = ThemeMode.light,
        darkMode = DarkMode.dark,
        useAdaptiveFontSystem = false,
        mainColor = Colors.blue;

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return _$ThemeStateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ThemeStateToJson(this);

  ThemeState copyWith({
    ThemeMode mode,
    DarkMode darkMode,
    bool useAdaptiveFontSystem,
    MaterialColor mainColor,
  }) =>
      ThemeState(
        darkMode: darkMode ?? this.darkMode,
        mode: mode ?? this.mode,
        useAdaptiveFontSystem:
            useAdaptiveFontSystem ?? this.useAdaptiveFontSystem,
        mainColor: mainColor ?? this.mainColor,
      );

  @override
  List<Object> get props => [mode, darkMode, useAdaptiveFontSystem, mainColor];

  @override
  String toString() {
    return 'ThemeState { $mode $darkMode useAdaptiveFontSystem: $useAdaptiveFontSystem  mainColor $mainColor}';
  }
}
