import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supermedia/layers/domain/use_cases/signup_use_case.dart';
import 'package:supermedia/layers/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:supermedia/layers/presentation/auth/signup/widgets/signup_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/email_text_fileld.dart';
import 'package:supermedia/layers/presentation/shared/widgets/password_text_field.dart';

class SignupScreen extends StatelessWidget {
  final SignUpUseCase signupUseCase;

  const SignupScreen({Key? key, required this.signupUseCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (_) => SignupBloc(signupUseCase: signupUseCase),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.signUp),
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
    ThemeData themeData = Theme.of(context);

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
                AppLocalizations.of(context)!.userRegistered(state.user.email),
              ),
            ),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              EmailTextField(controller: _emailController),
              PasswordTextField(controller: _passwordController),
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
