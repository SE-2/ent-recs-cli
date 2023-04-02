import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/layers/common/app_theme/app_theme.dart';
import 'package:supermedia/layers/common/app_theme/app_theme_bloc.dart';
import 'package:supermedia/layers/di/app_module.dart';

void main() {
  runApp(
    BlocProvider<AppThemeBloc>(
      create: (context) => AppThemeBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appModule = AppModule();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, ThemeMode>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'SuperMedia',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState,
          home: _appModule.provideSignUpScreen(),
        );
      },
    );
  }
}
