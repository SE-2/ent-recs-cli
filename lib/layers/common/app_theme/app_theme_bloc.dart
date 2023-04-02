import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/layers/data/data_sources/local_user_data_source.dart';

class AppThemeBloc extends Cubit<ThemeMode> {
  final LocalUserDataSource localUserDataSource;

  AppThemeBloc({required this.localUserDataSource}) : super(ThemeMode.system) {
    _initThemeMode();
  }

  Future<void> _initThemeMode() async {
    final themeMode = localUserDataSource.getThemeMode();
    emit(themeMode);
  }

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    localUserDataSource.setThemeMode(state);
  }
}
