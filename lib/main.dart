import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supermedia/common/locale/app_locale_bloc.dart';
import 'package:supermedia/common/theme/app_theme.dart';
import 'package:supermedia/common/theme/app_theme_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';

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
                home: MediaList(
                  title: 'My Media List',
                  mediaList: List.generate(
                    10,
                        (index) => MediaListItem(
                      mediaType: 'Book',
                      title: 'Book Title ${index + 1}',
                      pages: '100 Pages',
                      publishDate: '2020',
                      genre: 'Fiction',
                      imageUrl: 'https://www.iranketab.ir/Images/ProductImages/ca03ef61c7654a0a910846e5dc4afd09.jpg',
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
