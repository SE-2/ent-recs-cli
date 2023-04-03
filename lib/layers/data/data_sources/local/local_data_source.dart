import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  ThemeMode getThemeMode();

  Future<void> setThemeMode(ThemeMode themeMode);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences = GetIt.I<SharedPreferences>();
  static const String _themeModeKey = 'theme_mode';

  @override
  ThemeMode getThemeMode() {
    final themeModeIndex =
        sharedPreferences.getInt(_themeModeKey) ?? ThemeMode.system.index;
    return ThemeMode.values[themeModeIndex];
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) {
    return sharedPreferences.setInt(_themeModeKey, themeMode.index);
  }
}
