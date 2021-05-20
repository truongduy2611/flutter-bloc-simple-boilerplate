import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple_boilerplate/common/widgets/widgets.dart';
import 'package:flutter_bloc_simple_boilerplate/localization/keys.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key, this.hasAppBar = true}) : super(key: key);
  final bool hasAppBar;

  @override
  Widget build(BuildContext context) {
    final currentLanguage = LocalizedApp.of(context).delegate.currentLocale;

    return Scaffold(
      appBar: hasAppBar
          ? AppBar(
              title: Text(translate(Keys.settings)),
            )
          : null,
      body: ListView(
        children: <Widget>[
          LanguageSettingTile(currentLanguage: currentLanguage),
          const Divider(height: 0),
          const AppearanceSettingTile(),
          const Divider(height: 0),
        ],
      ),
    );
  }
}
