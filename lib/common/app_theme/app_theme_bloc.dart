import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';

class AppThemeBloc extends Cubit<ThemeMode> {
  final LocalDataSource localUserDataSource = GetIt.I<LocalDataSource>();

  AppThemeBloc() : super(ThemeMode.system) {
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
