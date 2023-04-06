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
        appBar: AppBar(
          title: Text(AppLocalization.of(context)!.signUp),
        ),
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
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
