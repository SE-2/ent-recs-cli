import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';

class AppThemeBloc extends Cubit<ThemeMode> {
  AppThemeBloc() : super(locator<LocalDataSource>().getThemeMode());

  void setThemeMode(ThemeMode themeMode) {
    emit(themeMode);
    locator<LocalDataSource>().setThemeMode(state);
  }
}
