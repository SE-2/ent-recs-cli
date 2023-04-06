import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';

import 'input_validator.dart';

class EmailValidator implements InputValidator {
  final BuildContext context;

  EmailValidator.of(this.context);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalization.of(context)!.requiredEmail;
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$');
    if (!emailRegex.hasMatch(value)) {
      return AppLocalization.of(context)!.invalidEmail;
    }
    return null;
  }
}
