import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:supermedia/layers/presentation/auth/signup/widgets/social_media_button.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_primary_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_text_field.dart';

class SignupScreen extends StatelessWidget {
  static const String route = '/';

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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<AppTextFieldState> _appTextFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 32),
              Text(AppLocalization.of(context)!.createAccount,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(height: 8),
              Text(AppLocalization.of(context)!.welcomeToApp,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Theme.of(context).colorScheme.background),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        AppTextField(
                          key: const Key('signupEmailTextFiled'),
                          label: AppLocalization.of(context)!.email,
                          hint: AppLocalization.of(context)!.enterYourEmail,
                        ),
                        const SizedBox(height: 24),
                        AppPrimaryButton(
                            text: AppLocalization.of(context)!.continueWithEmail,
                            onPressed: () {}),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.line.svg(),
                            const SizedBox(width: 12),
                            Text(AppLocalization.of(context)!.or),
                            const SizedBox(width: 12),
                            Assets.icons.line.svg()
                          ],
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<SignupBloc, SignupState>(
                          builder: (context, state) {
                            if (state is SignupSuccess) {
                              var userModel = state.userModel;
                              Future.delayed(const Duration(milliseconds: 200), () {
                                Navigator.pushReplacementNamed(context, HomeScreen.route, arguments: userModel);
                              });
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SocialMediaButton(
                                    text: '',
                                    onPressed: _doOnContinueWithEmailPressed,
                                    icon: null,
                                  ),
                                  const CircularProgressIndicator(),
                                ],
                              );
                            }
                            else if (state is SignupLoading) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SocialMediaButton(
                                    text: '',
                                    onPressed: _doOnContinueWithEmailPressed,
                                    icon: null,
                                  ),
                                  const CircularProgressIndicator(),
                                ],
                              );
                            } else {
                              return SocialMediaButton(
                                text: AppLocalization.of(context)!.continueWithGoogle,
                                onPressed: _doOnContinueWithEmailPressed,
                                icon: Assets.icons.google.svg(width: 24, height: 24),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        SocialMediaButton(
                          text: AppLocalization.of(context)!.continueWithFacebook,
                          onPressed: () {},
                          icon: Assets.icons.facebook.svg(width: 28, height: 28),
                        ),
                        const SizedBox(height: 12),
                        SocialMediaButton(
                          text: AppLocalization.of(context)!.continueWithTwitter,
                          onPressed: () {},
                          icon: Assets.icons.twitter.svg(width: 32, height: 32),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalization.of(context)!.alreadyHaveAnAccount,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                AppLocalization.of(context)!.login,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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

  void _doOnContinueWithEmailPressed() {
    context.read<SignupBloc>().add(const SignupWithGoogleButtonPressed());
  }
}
