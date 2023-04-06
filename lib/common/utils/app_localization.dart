import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLocalization extends WidgetsBindingObserver {
  static AppLocalizations? _localizations;
  static Locale? _locale;

  static Future<void> load(Locale locale) async {
    _localizations = await AppLocalizations.delegate.load(locale);
    _locale = locale;
  }

  static Future<void> init() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    final preferred = widgetsBinding.window.locale;
    const supported = AppLocalizations.supportedLocales;
    final locale = basicLocaleListResolution([preferred], supported);
    await load(locale);

    widgetsBinding.addObserver(AppLocalization());
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static void setLocale(Locale locale) async {
    if (_locale != locale) {
      await load(locale);
      WidgetsBinding.instance.buildOwner?.reassemble(
          WidgetsBinding.instance.renderViewElement!,
          BindingBase.debugReassembleConfig);
    }
  }

  static AppLocalizations get instance => _localizations!;

  static Locale get locale => _locale!;

  @override
  void didChangeLocales(List<Locale>? locales) {
    final preferred = WidgetsBinding.instance.window.locale;
    const supported = AppLocalizations.supportedLocales;
    final locale = basicLocaleListResolution([preferred], supported);
    setLocale(locale);
  }
}
