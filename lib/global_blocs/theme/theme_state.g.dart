// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeState _$ThemeStateFromJson(Map<String, dynamic> json) {
  return ThemeState(
    mode: _$enumDecodeNullable(_$ThemeModeEnumMap, json['mode']),
    darkMode: _$enumDecodeNullable(_$DarkModeEnumMap, json['darkMode']),
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

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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
