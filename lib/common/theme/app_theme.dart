import 'package:flutter/material.dart';

class AppTheme {
  static const defaultFontFamily = 'Plus Jakarta Sans';

  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Color(0xff514EB6),
      onPrimary: Colors.white,
      secondary: Color(0xFFf6f8fe),
      onSecondary: Color(0xFF9CA4AB),
      background: Color(0xFFFEFEFE),
      surface: Colors.grey,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      displayMedium: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      displaySmall: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      bodyLarge: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.black54,
      ),
      bodyMedium: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.grey,
      ),
      headlineLarge: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      titleMedium: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16,
        color: Colors.black87,
      ),
      titleSmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 14,
        color: Colors.black54,
      ),
      labelLarge: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.black54,
      ),
      labelSmall: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white,
        fontSize: 10,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF514EB6),
      onPrimary: Colors.white,
      secondary: Color(0xFF282837),
      onSecondary: Color(0xFF9CA4AB),
      background: Color(0xFF171725),
      surface: Colors.grey,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      displayMedium: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      displaySmall: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      bodyLarge: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.grey,
      ),
      headlineLarge: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      headlineSmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        fontFamily: defaultFontFamily,
      ),
      titleMedium: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 14,
        color: Colors.white70
      ),
      labelLarge: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white70,
      ),
      labelSmall: TextStyle(
        fontFamily: defaultFontFamily,
        color: Colors.white,
        fontSize: 10,
      ),
    ),
  );
}
