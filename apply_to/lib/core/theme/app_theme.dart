import 'package:flutter/material.dart';
import 'color_schemes.g.dart';

abstract class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme.copyWith(
      brightness: Brightness.light,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: lightColorScheme.background,
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme.copyWith(
      brightness: Brightness.dark,
      onPrimary: Colors.white, 
    ),
    scaffoldBackgroundColor: darkColorScheme.background,
  );
}
