import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermedia/di/app_module.dart';

abstract class LocalDataSource {
  ThemeMode getThemeMode();

  Future<void> setThemeMode(ThemeMode themeMode);

  Locale getLocale();

  Future<void> setLocale(Locale locale);
}

class LocalDataSourceImpl implements LocalDataSource {
  static const String _themeModeKey = 'theme_mode';
  static const String _localeKey = 'locale';

  final _prefs = locator<SharedPreferences>();

  @override
  ThemeMode getThemeMode() {
    final index = _prefs.getInt(_themeModeKey) ?? ThemeMode.system.index;
    return ThemeMode.values[index];
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) {
    return _prefs.setInt(_themeModeKey, themeMode.index);
  }

  @override
  Locale getLocale() {
    final localeString = _prefs.getString(_localeKey);
    if (localeString != null) {
      final split = localeString.split('_');
      if (split.length == 2) {
        return Locale(split[0], split[1]);
      }
    }
    return const Locale('en', 'US');
  }

  @override
  Future<void> setLocale(Locale locale) {
    return _prefs.setString(
        _localeKey, '${locale.languageCode}_${locale.countryCode}');
  }
}
