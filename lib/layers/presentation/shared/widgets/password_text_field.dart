import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.password,
      ),
      validator: Validators.validatePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
    );
  }
}
