import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/layers/presentation/auth/signup/bloc/signup_bloc.dart';

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

  void _submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<SignupBloc>().add(
            SignupButtonPressed(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _submitForm(context),
      child: const Text('Sign up'),
    );
  }
}
