import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Colors.deepPurple,
  ),
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.deepPurple,
  ),
  useMaterial3: true,
);

abstract class Pallete {
  static const Color primary = Color(0xff6750A4);
  static const Color tertiary = Color(0xffeeeeee);
}
