part of 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState.system()) {
    on<SetAdaptiveFontSystemEvent>(
      (event, emit) {
        final newState = state.copyWith(
          useAdaptiveFontSystem: event.useAdaptiveFontSystem,
        );
        emit(newState);
        saveThemeState(newState);
      },
    );

    on<LoadThemeFromPrefEvent>(
      (event, emit) async {
        emit(await getThemeState());
      },
    );
    on<SetThemeMode>(
      (event, emit) {
        final newState = state.copyWith(mode: event.mode);
        emit(newState);
        saveThemeState(newState);
      },
    );
    on<SetDarkMode>(
      (event, emit) {
        final newState = state.copyWith(darkMode: event.mode);
        emit(newState);
        saveThemeState(newState);
      },
    );
    on<SetMainColorEvent>(
      (event, emit) {
        final newState = state.copyWith(mainColor: event.color);
        emit(newState);
        saveThemeState(newState);
      },
    );
  }

  Future<ThemeState> getThemeState() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final themeString = instance.getString('THEME');
      if (themeString != null) {
        final themeJson = json.decode(themeString);
        return ThemeState.fromJson(themeJson);
      }
    } catch (_) {}
    return const ThemeState.system();
  }

  Future<bool> saveThemeState(ThemeState state) async {
    try {
      final instance = await SharedPreferences.getInstance();
      return await instance.setString('THEME', json.encode(state.toJson()));
    } catch (e) {
      return false;
    }
  }
}
