# flutter_bloc_simple_boilerplate

A simple Flutter bolilerplate using BLoC.

## Project Info

To get packages, run: `flutter pub get`
To generate models, run: `flutter packages pub run build_runner watch --delete-conflicting-outputs`
To generate app icons, run: `flutter pub run flutter_launcher_icons:main`

## Localizations

https://pub.dev/packages/flutter_translate/example

1. Add other locales:

- Create `assets/i18n/new-lang.json`
- Added new locale to `lib/contants/localizations.dart`

```dart
    const supportLocaleInfos = [
    LocaleInfo(Locale('vi', 'VN'), name: 'Tiếng Việt', flag: '🇻🇳',flagImageUrl: Assets.viIcon,),
    LocaleInfo(Locale('en', 'US'),name: 'English', flag: '🇺🇸', flagImageUrl: Assets.enIcon),
    LocaleInfo(Locale('ne', 'NE'), name: 'New Locale', flag: 'emoji', flagImageUrl: 'path/to/your/image/url/in/your/asset',)
    ];
```

2. Access to the current locale

```dart
    LocalizedApp.of(context).delegate.currentLocale
```

3. Add new locale option to settings
   --> Check TODO in line 46 of file `lib/common/widgets/language_settings_tile.dart`

4. Reference the keys in Dart code

```dart
Widget build(BuildContext context) {
    return Column(children: [
        Text(
            translate(Keys.title),
        ),
        Text(
             translate('your_title_name_in_your_json_file'), // If you don't gen Keys in `lib/localization.dart`
        ),
    ]);
}
```

## Project Structure

```
lib/
  |-common/
  | |-transitions/                 ---> place your transitions
  | |-widgets/                     ---> place your common widgets
  |-config/
  | |-flavor_config.dart           ---> define your flavor config, env of app
  |-constants/
  | |-assets.dart                  ---> constants of assets file in `assets`
  | |-constants.dart               ---> some constants enums
  | |-env.dart                     ---> constants of baseUrl, env and some appKeys
  | |-localizations.dart           ---> supportLanguages, LocalInfo
  |-globals_bloc/                  ---> global blocs need to provide for MyApp
  |-localization/keys.dart         ---> static Keys constants class for quick access translateKey
  |-models/                        ---> place object models
  |  |-*.dart/                     ---> place other object models and JsonSerializableGenerator generator of their models
  |-router
  | |-route_generator.dart         ---> RouteGenerator.generateRoute for MaterialApp, and createRoute for pushTo new page/screen.
  | |-routes.dart                  ---> Route name
  |-repositories/                  ---> place your repositories
  | |-*_repository/                ---> repostiries and their api_client or storage
  | |-api_client.dart              ---> DioApiClients and Clients for every backend services
  | |-data_response.dart           ---> DataReponse and makeRequest function for common api request
  |-screen/                        ---> define all pages/screens of application
  | |-login/                       ---> place app login module included login ui and logic. We should organize as app module (eg: home, about, ...) rather then platform module (eg: activity, dialog, ...)
  | | |-bloc/                      ---> define login_event, login_state, login_bloc
  | | |-login.dart                 ---> define import file and parts of login
  | | |-login_page.dart            ---> define LoginPage and BlocPrivder of LoginBloc for LoginContainer
  | | |-login_container.dart       ---> define LoginContainer and BlocBuilder of LoginBloc, interact dispatch event to LoginBloc and change LoginState
  |-utils/                         ---> place app utils
  |-|-bloc_observer.dart           ---> bloc logger transitions for development env
  | |-bloc_providers.dart          ---> BlocProvider for global_blocs and repositories function helpers
  | |-theme_helpers.dart            ---> ThemeBuilder base on mainColor, ThemeMode
  | |-translations                 ---> persist current locale and get device current locale
  | |-ui_helpers.dart              ---> BuildContext for getting Theme, Locale, gutter, spacing,...
  |-app.dart                       ---> MyApp -> MaterialApp, generateRoute, provide  global_blocs and repositories, theme
  |-main_common.dart               ---> application bootstrap for init Firebase Analytics, Localizations, RunZone,...
  |-main.dart          ---> entry for Flavor.DEV and dev env, local server in same router network or IP Address, configurable merchantId and endpoint entries
  |-main_qa.dart                   ---> entry for Flavor.STAGING and STAGING env
  |-main_production.dart           ---> entry for Flavor.PRODUCTION and PRODUCTION env

```

## Versioning

```
version: 1.0.1+1
---
Version name: 1.0.1
Version code: 1
```

Version name: major.minor.build
Version code: <build number from 000>

## Multi env

- Run/Build with specific env

```
flutter run -t lib/main.dart # main/main_staging/main_production.dart

flutter build ios -t lib/main_***.dart
flutter build appbundle -t lib/main_***.dart
flutter build apk -t lib/main_***.dart  --target-platform  android-arm64
```
