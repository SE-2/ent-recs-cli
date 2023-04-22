import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:supermedia/layers/presentation/auth/signup/widgets/signup_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/email_text_fileld.dart';
import 'package:supermedia/layers/presentation/shared/widgets/password_text_field.dart';
import 'package:supermedia/layers/presentation/validators/email_validator.dart';
import 'package:supermedia/layers/presentation/validators/password_validator.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (_) => locator<SignupBloc>(),
      child: Scaffold(
        body: _SignupForm(),
      ),
    );
  }
}

class _SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<_SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppLocalization.of(context)!.userRegistered(state.user.email),
              ),
            ),
          );
        }
      },
      child: Container(
        color: const Color(0xFF514EB6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 42),
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome to super media!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 24),
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF78828a),
                        ),
                      ),
                      EmailTextField(
                        controller: _emailController,
                        labelText: AppLocalization.of(context)!.email,
                        validator: EmailValidator.of(context).validate,
                      ),
                      PasswordTextField(
                        controller: _passwordController,
                        labelText: AppLocalization.of(context)!.password,
                        validator: PasswordValidator.of(context).validate,
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          if (state is SignupLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else {
                            return SignUpButton(
                              formKey: _formKey,
                              emailController: _emailController,
                              passwordController: _passwordController,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
