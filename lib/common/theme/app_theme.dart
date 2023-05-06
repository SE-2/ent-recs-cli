import 'package:flutter/material.dart';

class AppTheme {
  static const defaultFontFamily = 'Plus Jakarta Sans';

  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Color(0xff514EB6),
      onPrimary: Colors.white,
      secondary: Color(0xFFf6f8fe),
      onSecondary: Color(0xFFf6f8fe),
      background: Color(0xFFFEFEFE),
      surface: Colors.grey,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 18.0,
        color: Colors.black54,
      ),
      bodyMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16.0,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 14.0,
        color: Colors.grey,
      ),
      headlineLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 14.0,
        color: Colors.black87,
      ),
      titleSmall: TextStyle(
          fontFamily: defaultFontFamily,
          fontSize: 12.0,
          color: Colors.black54,
          fontWeight: FontWeight.w500),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF514EB6),
      onPrimary: Colors.white,
      secondary: Color(0xFF171725),
      onSecondary: Color(0xFF282837),
      background: Color(0xFF171725),
      surface: Colors.grey,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 18.0,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16.0,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 14.0,
        color: Colors.grey,
      ),
      headlineLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      headlineMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16.0,
        color: Colors.white70,
      ),
      titleSmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 14.0,
        color: Colors.white70,
      ),
    ),
  );
}
