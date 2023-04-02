import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeBloc extends Cubit<ThemeMode> {
  AppThemeBloc() : super(ThemeMode.system);

  void toggleTheme() {
    emit(state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light);
  }
}
