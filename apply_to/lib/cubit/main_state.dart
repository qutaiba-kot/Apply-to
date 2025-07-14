import 'package:equatable/equatable.dart';

enum AppLanguage { ar, en }
enum AppThemeMode { light, dark }

class MainState extends Equatable {
  final AppLanguage language;
  final AppThemeMode themeMode;
  final bool isLoggedIn;

  const MainState({
    required this.language,
    required this.themeMode,
    required this.isLoggedIn,
  });

  factory MainState.initial() {
    return const MainState(
      language: AppLanguage.en,
      themeMode: AppThemeMode.light,
      isLoggedIn: false,
    );
  }

  MainState copyWith({
    AppLanguage? language,
    AppThemeMode? themeMode,
    bool? isLoggedIn,
  }) {
    return MainState(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'language': language.name,
      'themeMode': themeMode.name,
      'isLoggedIn': isLoggedIn,
    };
  }

  factory MainState.fromMap(Map<String, dynamic> map) {
    return MainState(
      language: AppLanguage.values.firstWhere((e) => e.name == map['language']),
      themeMode: AppThemeMode.values.firstWhere((e) => e.name == map['themeMode']),
      isLoggedIn: map['isLoggedIn'] ?? false,
    );
  }

  @override
  List<Object?> get props => [language, themeMode, isLoggedIn];
}
