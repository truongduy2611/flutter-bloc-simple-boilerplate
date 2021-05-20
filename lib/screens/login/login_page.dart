part of 'login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WithDialog(
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            Navigator.pushReplacementNamed(context, Routes.home);
          }
        },
        child: BlocProvider(
          create: (context) => LoginBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
            alertBloc: BlocProvider.of<AlertBloc>(context),
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
          child: const LoginContainer(),
        ),
      ),
    );
  }
}
