import 'package:supermedia/common/utils/app_localization.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalization.instance.requiredEmail;
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$');
    if (!emailRegex.hasMatch(value)) {
      return AppLocalization.instance.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalization.instance.requiredPassword;
    }
    if (value.length < 8) {
      return AppLocalization.instance.weakPassword;
    }
    return null;
  }
}
