import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/common/utils/validators.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppLocalization.of(context)!.email,
      ),
      validator: Validators.validateEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
