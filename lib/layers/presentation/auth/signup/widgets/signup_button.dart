import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  void _submitForm(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _submitForm(context),
      child: Text(AppLocalization.of(context)!.signUp),
    );
  }
}
