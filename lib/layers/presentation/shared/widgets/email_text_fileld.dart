import 'package:flutter/material.dart';
import 'package:supermedia/layers/common/utils/validators.dart';

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
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      validator: Validators.validateEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
