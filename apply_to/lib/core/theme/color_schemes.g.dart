import 'package:flutter/material.dart';

ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 222, 176, 9),
  primary: const Color.fromARGB(255, 222, 176, 9),
  background: Colors.white,
  onBackground: Colors.black,
  onPrimary: Colors.white, 
  secondary: Colors.grey,
);

ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 222, 176, 9),
  primary: const Color.fromARGB(255, 222, 176, 9),
  background: const Color(0xFF121212), 
  onBackground: Colors.white,
  onPrimary: Colors.black, 
  secondary: Colors.grey,
);

class AppTheme {
  static final light = ThemeData.from(colorScheme: lightColorScheme);
  static final dark = ThemeData.from(colorScheme: darkColorScheme);
}
