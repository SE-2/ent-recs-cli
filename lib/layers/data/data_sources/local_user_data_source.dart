import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalUserDataSource {
  ThemeMode getThemeMode();

  Future<void> setThemeMode(ThemeMode themeMode);
}

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final SharedPreferences sharedPreferences;
  static const String _themeModeKey = 'theme_mode';

  LocalUserDataSourceImpl({required this.sharedPreferences});

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
