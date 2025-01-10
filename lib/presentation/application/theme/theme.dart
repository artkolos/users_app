import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0x4D9E9E9E),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xB3F44336),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xB3F44336),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFF789BAE),
    onSurface: Color(0xFFFFFFFF),
  ),
);
