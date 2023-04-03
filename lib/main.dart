import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:supermedia/common/app_theme/app_theme.dart';
import 'package:supermedia/common/app_theme/app_theme_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupAppModule();
  runApp(
    BlocProvider<AppThemeBloc>(
      create: (context) => AppThemeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: GetIt.I<SignupScreen>(),
        );
      },
    );
  }
}
