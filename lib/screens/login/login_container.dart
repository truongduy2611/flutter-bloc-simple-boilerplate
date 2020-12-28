part of 'login.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key key}) : super(key: key);

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  void _onPressedLogin() {
    final isValidForm = _fbKey.currentState.saveAndValidate();

    if (isValidForm) {
      BlocProvider.of<LoginBloc>(context).add(
        OnPressedLoginButtonEvent(_fbKey.currentState.value),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          LanguageSettingTile(
            languageTileBuilder: (context, locale, onPressed) {
              return FlatButton.icon(
                onPressed: onPressed,
                icon: Image.asset(
                  locale.flagImageUrl,
                  height: spacing * 4,
                  width: spacing * 4,
                ),
                label: Text(locale.name),
              );
            },
            currentLanguage: LocalizedApp.of(context).delegate.currentLocale,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(spacing * 2),
          child: FormBuilder(
            key: _fbKey,
            initialValue: const <String, dynamic>{
              'email': '',
              'password': '',
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  Assets.logoIcon,
                  height: 128,
                  width: 128,
                ),
                const SizedBox(height: spacing * 4),
                FormBuilderTextField(
                  name: 'email',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      context,
                      errorText: translate(Keys.email_is_required),
                    ),
                    FormBuilderValidators.email(
                      context,
                      errorText: translate(Keys.email_is_invalid),
                    )
                  ]),
                  decoration: InputDecoration(
                    labelText: translate(
                      Keys.email,
                    ),
                  ),
                ),
                const SizedBox(height: spacing * 2),
                FormBuilderTextField(
                  name: 'password',
                  obscureText: true,
                  maxLines: 1,
                  validator: FormBuilderValidators.required(
                    context,
                    errorText: translate(Keys.password_is_required),
                  ),
                  decoration: InputDecoration(
                    labelText: translate(
                      Keys.password,
                    ),
                  ),
                ),
                const SizedBox(height: spacing * 2),
                FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: _onPressedLogin,
                  label: Text(translate(Keys.login)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
