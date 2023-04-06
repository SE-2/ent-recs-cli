import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';

class AppLocaleBloc extends Cubit<Locale> {
  AppLocaleBloc() : super(locator<LocalDataSource>().getLocale());

  void updateLocale(Locale locale) {
    emit(locale);
    locator<LocalDataSource>().setLocale(locale);
  }
}
