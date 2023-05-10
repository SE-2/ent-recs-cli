import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supermedia/common/locale/app_locale_bloc.dart';
import 'package:supermedia/common/theme/app_theme.dart';
import 'package:supermedia/common/theme/app_theme_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'layers/presentation/home/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await AppLocalization.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeBloc>(create: (_) => locator<AppThemeBloc>()),
        BlocProvider<AppLocaleBloc>(create: (_) => locator<AppLocaleBloc>()),
      ],
      child: BlocBuilder<AppLocaleBloc, Locale>(
        builder: (context, locale) {
          return BlocBuilder<AppThemeBloc, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                title: 'SuperMedia',
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                home: locator<HomeScreen>()
              );
            },
          );
        },
      ),
    );
  }
}
