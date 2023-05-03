part of 'widgets.dart';

class AppearanceSettingTile extends StatelessWidget {
  const AppearanceSettingTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _getSubtitleByThemeMode(ThemeMode mode) {
      switch (mode) {
        case ThemeMode.dark:
          return translate(Keys.appearance_dark);
        case ThemeMode.light:
          return translate(Keys.appearance_light);
        default:
          return translate(Keys.appearance_system);
      }
    }

    void _onPressedAppearance() {
      showDialog(
        context: context,
        builder: (context) {
          final themeState = BlocProvider.of<ThemeBloc>(context).state;
          final themeMode = themeState.mode;
          // final darkMode = themeState.darkMode;
          final useAdaptiveFontSystem = themeState.useAdaptiveFontSystem;

          void _onSetThemeMode(ThemeMode? mode) {
            BlocProvider.of<ThemeBloc>(context).add(SetThemeMode(mode!));
          }

          return AlertDialog(
            contentPadding: const EdgeInsets.all(spacing * 2),
            title: Text(translate(Keys.appearance)),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 256,
                    child: MaterialColorPicker(
                      allowShades: false,
                      onMainColorChange: (color) {
                        if (color is MaterialColor) {
                          BlocProvider.of<ThemeBloc>(context).add(
                            SetMainColorEvent(color: color),
                          );
                        }
                      },
                      selectedColor: themeState.mainColor,
                      colors: Colors.primaries,
                    ),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: themeMode,
                    onChanged: _onSetThemeMode,
                    title: Text(translate(Keys.appearance_light)),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: themeMode,
                    onChanged: _onSetThemeMode,
                    title: Text(translate(Keys.appearance_dark)),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: themeMode,
                    onChanged: _onSetThemeMode,
                    title: Text(translate(Keys.appearance_system)),
                  ),
                  // SwitchListTile(
                  //   dense: true,
                  //   value: darkMode == DarkMode.trueDark,
                  //   title: Text(translate(Keys.appearance_use_true_dark)),
                  //   onChanged: themeMode != ThemeMode.light
                  //       ? (isTrueDark) {
                  //           BlocProvider.of<ThemeBloc>(context).add(
                  //             SetDarkMode(isTrueDark
                  //                 ? DarkMode.trueDark
                  //                 : DarkMode.dark),
                  //           );
                  //         }
                  //       : null,
                  // ),
                  SwitchListTile(
                    value: useAdaptiveFontSystem == true,
                    title: Text(translate(Keys.use_adaptive_font_system)),
                    onChanged: (useAdaptiveFontSystem) {
                      BlocProvider.of<ThemeBloc>(context).add(SetAdaptiveFontSystemEvent(useAdaptiveFontSystem));
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(translate(Keys.ok)),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }

    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return ListTile(
        leading: const Icon(
          Icons.palette,
          size: 24,
        ),
        title: Text(translate(Keys.appearance)),
        subtitle: Text(_getSubtitleByThemeMode(state.mode)),
        onTap: _onPressedAppearance,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: spacing * 2),
      );
    });
  }
}
