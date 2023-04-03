import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermedia/common/app_theme/app_theme.dart';
import 'package:supermedia/common/app_theme/app_theme_bloc.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';
import 'package:supermedia/di/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final localUserDataSource = LocalDataSourceImpl(
    sharedPreferences: sharedPreferences,
  );

  runApp(
    BlocProvider<AppThemeBloc>(
      create: (context) => AppThemeBloc(localUserDataSource: localUserDataSource),
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
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState,
          home: _appModule.provideSignUpScreen(),
        );
      },
    );
  }
}
