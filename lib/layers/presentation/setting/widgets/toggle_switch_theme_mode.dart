import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/theme/app_theme_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/local_data_source.dart';

class ToggleSwitchThemeMode extends StatefulWidget {
  const ToggleSwitchThemeMode({
    super.key,
  });

  @override
  State<ToggleSwitchThemeMode> createState() => _ToggleSwitchThemeModeState();
}

class _ToggleSwitchThemeModeState extends State<ToggleSwitchThemeMode> {
  @override
  Widget build(BuildContext context) {
    ThemeMode selectedThemeMode = locator<LocalDataSource>().getThemeMode();
    bool isDarkModeEnabled = selectedThemeMode == ThemeMode.dark;

    return Switch(
      activeColor: Theme.of(context).colorScheme.primary,
      value: isDarkModeEnabled,
      onChanged: (value) {
        setState(() {
          isDarkModeEnabled = value;
        });
        if (isDarkModeEnabled) {
          context.read<AppThemeBloc>().setThemeMode(ThemeMode.dark);
        } else {
          context.read<AppThemeBloc>().setThemeMode(ThemeMode.light);
        }
      },
    );
  }
}
