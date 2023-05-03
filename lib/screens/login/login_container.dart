part of 'login.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  late FormGroup _formGroup;

  @override
  void initState() {
    super.initState();
    _formGroup = FormGroup({
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
    });
  }

  void _onPressedLogin() {
    _formGroup.markAllAsTouched();
    if (_formGroup.valid) {
      FocusManager.instance.rootScope.unfocus();
      BlocProvider.of<LoginBloc>(context).add(
        OnPressedLoginButtonEvent(_formGroup.value),
      );
    }
  }

  void _onPressedSkipButton() {
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            LanguageSettingTile(
              languageTileBuilder: (context, locale, onPressed) {
                return TextButton.icon(
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(spacing * 2),
          child: ReactiveForm(
            formGroup: _formGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: spacing * 4),
                Image.asset(
                  Assets.logoIcon,
                  height: 96,
                  width: 96,
                ),
                const SizedBox(height: spacing * 2),
                ReactiveTextField(
                  formControlName: 'email',
                  autocorrect: false,
                  validationMessages: {
                    ValidationMessage.required: (_) => translate(Keys.email_is_required),
                    ValidationMessage.email: (_) => translate(Keys.email_is_invalid)
                  },
                  decoration: InputDecoration(
                    labelText: translate(
                      Keys.email,
                    ),
                  ),
                  autofillHints: const [AutofillHints.email],
                ),
                const SizedBox(height: spacing * 2),
                ReactiveTextField(
                  formControlName: 'password',
                  autocorrect: false,
                  obscureText: true,
                  validationMessages: {
                    ValidationMessage.required: (_) => translate(Keys.password_is_required),
                  },
                  decoration: InputDecoration(
                    labelText: translate(Keys.password),
                  ),
                  autofillHints: const [AutofillHints.password],
                ),
                const SizedBox(height: spacing * 2),
                FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: _onPressedLogin,
                  label: Text(translate(Keys.login)),
                ),
                const SizedBox(height: spacing * 2),
                TextButton(
                  onPressed: _onPressedSkipButton,
                  child: Text(translate(Keys.skip_to_home)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
