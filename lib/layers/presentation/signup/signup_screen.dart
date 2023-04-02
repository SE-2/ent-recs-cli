import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/layers/common/app_theme/app_theme_bloc.dart';
import 'package:supermedia/layers/common/utils/validators.dart';
import 'package:supermedia/layers/domain/use_cases/signup_use_case.dart';
import 'package:supermedia/layers/presentation/signup/signup_bloc.dart';

class SignupScreen extends StatelessWidget {
  final SignupUseCase signupUseCase;

  const SignupScreen({Key? key, required this.signupUseCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (_) => SignupBloc(signupUseCase: signupUseCase),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Signup'),
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
  final _emailController = TextEditingController(text: "ali@gmail.com");
  final _passwordController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.user.email} registered."),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildEmailTextField(),
                _buildPasswordTextField(),
                const SizedBox(height: 16),
                if (state is SignupLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  _buildSignUpButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      validator: Validators.validateEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      validator: Validators.validatePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<AppThemeBloc>().toggleTheme();

        if (_formKey.currentState!.validate()) {
          context.read<SignupBloc>().add(
                SignupButtonPressed(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
        }
      },
      child: const Text('Sign up'),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
