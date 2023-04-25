import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.orange,
      onSecondary: Colors.black,
      background: Colors.white,
      surface: Colors.grey,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black54),
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14.0, color: Colors.grey),
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
      titleSmall: TextStyle(fontSize: 14.0, color: Colors.black54),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.orange,
      onSecondary: Colors.black,
      background: Colors.black,
      surface: Colors.grey,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white),
      bodySmall: TextStyle(fontSize: 14.0, color: Colors.grey),
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16.0, color: Colors.white70),
      titleSmall: TextStyle(fontSize: 14.0, color: Colors.white70),
    ),
  );
}
