part of 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => const ThemeState.system();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is SetAdaptiveFontSystemEvent) {
      final newState = state.copyWith(
        useAdaptiveFontSystem: event.useAdaptiveFontSystem,
      );
      yield newState;
      saveThemeState(newState);
    }
    if (event is LoadThemeFromPrefEvent) {
      yield await getThemeState();
    }
    if (event is SetThemeMode) {
      final newState = state.copyWith(mode: event.mode);
      yield newState;
      saveThemeState(newState);
    }
    if (event is SetDarkMode) {
      final newState = state.copyWith(darkMode: event.mode);
      yield newState;
      saveThemeState(newState);
    }

    if (event is SetMainColorEvent) {
      final newState = state.copyWith(mainColor: event.color);
      yield newState;
      saveThemeState(newState);
    }
  }

  Future<ThemeState> getThemeState() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final themeJson = json.decode(instance.getString('THEME'));
      return ThemeState.fromJson(themeJson);
    } catch (e) {
      return const ThemeState.system();
    }
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
