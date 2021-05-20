// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeState _$ThemeStateFromJson(Map<String, dynamic> json) {
  return ThemeState(
    mode: _$enumDecode(_$ThemeModeEnumMap, json['mode']),
    darkMode: _$enumDecode(_$DarkModeEnumMap, json['darkMode']),
    useAdaptiveFontSystem: json['useAdaptiveFontSystem'] as bool,
    mainColor: _mainColorFromJson(json['mainColor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThemeStateToJson(ThemeState instance) =>
    <String, dynamic>{
      'mode': _$ThemeModeEnumMap[instance.mode],
      'darkMode': _$DarkModeEnumMap[instance.darkMode],
      'useAdaptiveFontSystem': instance.useAdaptiveFontSystem,
      'mainColor': _mainColorToJson(instance.mainColor),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$DarkModeEnumMap = {
  DarkMode.trueDark: 'trueDark',
  DarkMode.dark: 'dark',
};
