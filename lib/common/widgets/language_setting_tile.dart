part of 'widgets.dart';

class LanguageSettingTile extends StatefulWidget {
  const LanguageSettingTile({
    Key? key,
    required this.currentLanguage,
    this.languageTileBuilder,
  }) : super(key: key);

  final Locale currentLanguage;
  final Function(BuildContext, LocaleInfo, VoidCallback)? languageTileBuilder;

  @override
  _LanguageSettingTileState createState() => _LanguageSettingTileState();
}

class _LanguageSettingTileState extends State<LanguageSettingTile> {
  bool isChanged = false;
  late Locale currentSelectedLocale;

  @override
  void initState() {
    currentSelectedLocale = widget.currentLanguage;
    super.initState();
  }

  void _onPressedLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(spacing * 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing),
          ),
          title: Text(translate(Keys.language)),
          content: StatefulBuilder(builder: (context, setState) {
            final currentLocaleInfo = supportLocaleInfoList.firstWhere(
              (l) => l.locale.countryCode == currentSelectedLocale.countryCode,
              orElse: () => supportLocaleInfoList[0],
            );

            Widget _buildCountryList(LocaleInfo localeInfo) {
              return RadioListTile<LocaleInfo>(
                value: localeInfo,
                groupValue: currentLocaleInfo,
                onChanged: (locale) {
                  currentSelectedLocale = locale!.locale;
                  isChanged = locale.locale.countryCode !=
                      widget.currentLanguage.countryCode;
                  setState(() {});
                  this.setState(() {});
                },
                title: Text(localeInfo.name),
                secondary: Image.asset(
                  localeInfo.flagImageUrl,
                  height: spacing * 4,
                  width: spacing * 4,
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: supportLocaleInfoList.map(_buildCountryList).toList(),
              ),
            );
          }),
          actions: <Widget>[
            TextButton(
              child: Text(translate(Keys.cancel)),
              onPressed: () {
                currentSelectedLocale = widget.currentLanguage;
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(translate(Keys.ok)),
              onPressed: () {
                Navigator.pop(context);
                if (isChanged) {
                  LocalizedApp.of(context)
                      .delegate
                      .changeLocale(currentSelectedLocale);
                  Phoenix.rebirth(context);
                }
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeDelegate = LocalizedApp.of(context).delegate;
    final currentLocale = localeDelegate.currentLocale;
    final currentLocaleInfo = supportLocaleInfoList.firstWhere(
        (l) => l.locale.countryCode == currentLocale.countryCode,
        orElse: () => supportLocaleInfoList[0]);

    if (widget.languageTileBuilder != null) {
      return widget.languageTileBuilder!(
        context,
        currentLocaleInfo,
        _onPressedLanguage,
      );
    }

    return ListTile(
      leading: const Icon(
        Icons.language,
        size: 32,
      ),
      title: Text(translate(Keys.language)),
      subtitle: Text(
        '${currentLocaleInfo.name} ${currentLocaleInfo.flag}',
      ),
      onTap: _onPressedLanguage,
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: spacing * 2),
    );
  }
}
