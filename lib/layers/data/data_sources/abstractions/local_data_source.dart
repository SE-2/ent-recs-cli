import 'package:flutter/material.dart';

abstract class LocalDataSource {
  ThemeMode getThemeMode();

  Future<void> setThemeMode(ThemeMode themeMode);

  Locale getLocale();

  Future<void> setLocale(Locale locale);
}