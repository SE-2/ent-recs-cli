import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';

import 'input_validator.dart';

class PasswordValidator implements InputValidator {
  final BuildContext context;

  PasswordValidator.of(this.context);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalization.of(context)!.requiredPassword;
    }
    if (value.length < 8) {
      return AppLocalization.of(context)!.weakPassword;
    }
    return null;
  }
}
