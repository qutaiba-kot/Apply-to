import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'main_state.dart';

class MainCubit extends HydratedCubit<MainState> {
  MainCubit() : super(MainState.initial());

  void toggleLanguage() {
    emit(state.copyWith(
      language: state.language == AppLanguage.ar ? AppLanguage.en : AppLanguage.ar,
    ));
  }

  void toggleTheme() {
    emit(state.copyWith(
      themeMode: state.themeMode == AppThemeMode.light ? AppThemeMode.dark : AppThemeMode.light,
    ));
  }

  void login() {
    emit(state.copyWith(isLoggedIn: true));
  }

  void logout() {
    emit(state.copyWith(isLoggedIn: false));
  }

  @override
  MainState fromJson(Map<String, dynamic> json) {
    return MainState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(MainState state) {
    return state.toMap();
  }
}
