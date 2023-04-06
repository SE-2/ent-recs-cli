import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/locale/app_locale_bloc.dart';
import 'package:supermedia/common/theme/app_theme_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!.settings),
      ),
      body: const SettingsForm(),
    );
  }
}

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  ThemeMode selectedThemeMode = locator<LocalDataSource>().getThemeMode();
  Locale selectedLocale = AppLocalization.locale;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButtonFormField<ThemeMode>(
              decoration: InputDecoration(
                labelText: AppLocalization.of(context)!.themeMode,
                border: const OutlineInputBorder(),
              ),
              value: selectedThemeMode,
              items: ThemeMode.values.map((mode) {
                return DropdownMenuItem<ThemeMode>(
                  value: mode,
                  child: Text(
                    mode.name == 'system'
                        ? AppLocalization.of(context)!.system
                        : mode.name == 'light'
                            ? AppLocalization.of(context)!.light
                            : AppLocalization.of(context)!.dark,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedThemeMode = value!;
                });
                context.read<AppThemeBloc>().setThemeMode(selectedThemeMode);
              },
            ),
            const SizedBox(height: 32),
            DropdownButtonFormField<Locale>(
              decoration: InputDecoration(
                labelText: AppLocalization.of(context)!.language,
                border: const OutlineInputBorder(),
              ),
              value: selectedLocale,
              items: <Locale>[const Locale('en'), const Locale('fa')]
                  .map((locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(
                    locale.toString() == 'en'
                        ? AppLocalization.of(context)!.english
                        : AppLocalization.of(context)!.persian,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLocale = value!;
                });
                context.read<AppLocaleBloc>().updateLocale(selectedLocale);
                AppLocalization.setLocale(selectedLocale);
              },
            ),
          ],
        ),
      ),
    );
  }
}
