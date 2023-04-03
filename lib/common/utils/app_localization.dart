import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLocalization {
  static late AppLocalizations _localizations;

  static void init() async {
    final preferred = WidgetsBinding.instance.window.locales;
    const supported = AppLocalizations.supportedLocales;
    final locale = basicLocaleListResolution(preferred, supported);
    _localizations = await AppLocalizations.delegate.load(locale);
  }

  static AppLocalizations get instance => _localizations;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}
