import 'package:flutter/material.dart';
import 'package:supermedia/layers/common/utils/validators.dart';

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
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      validator: Validators.validatePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
    );
  }
}
