import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple_boilerplate/constants/asset.dart';

const fallbackLocale = 'vi_VN';
const supportLocales = ['vi_VN', 'en_US'];

class LocaleInfo {
  final String name;
  final String flag;
  final Locale locale;
  final String flagImageUrl;

  const LocaleInfo(
    this.locale, {
    required this.name,
    required this.flag,
    required this.flagImageUrl,
  });
}

const supportLocaleInfoList = [
  LocaleInfo(
    Locale('vi', 'VN'),
    name: 'Tiếng Việt',
    flag: '🇻🇳',
    flagImageUrl: Assets.viIcon,
  ),
  LocaleInfo(
    Locale('en', 'US'),
    name: 'English',
    flag: '🇺🇸',
    flagImageUrl: Assets.enIcon,
  ),
];
