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

  static const Color uptoCGPA3_9 = Color(0xff379237);
  static const Color uptoCGPA3_4 = Color(0xff82CD47);
  static const Color uptoCGPA2_2 = Color(0xffCEFF42);
  static const Color uptoCGPA1_5 = Color(0xffF0FF42);
}
