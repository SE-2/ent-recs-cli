import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/shared/multi_screen_bottom_navigation.dart';
import 'package:supermedia/layers/presentation/splash/bloc/splash_bloc.dart';
import 'package:supermedia/layers/presentation/splash/bloc/splash_event.dart';
import 'package:supermedia/layers/presentation/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => locator<SplashBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _SplashForm(),
      ),
    );
  }
}

class _SplashForm extends StatefulWidget {
  @override
  _SplashFormState createState() => _SplashFormState();
}

class _SplashFormState extends State<_SplashForm> {
  @override
  void initState() {
    context.read<SplashBloc>().add(SplashCheckLoginStatus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          if (state.isLoggedIn) {
            Navigator.pushReplacementNamed(context, MultiScreenBottomNavigation.route);
          }
          else {
            Navigator.pushReplacementNamed(context, SignupScreen.route);
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 72,),
            Assets.images.logo.image(width: 256, height: 256),
            const SizedBox(height: 16),
            Text(
              AppLocalization.of(context)!.title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalization.of(context)!.entertainment,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary
              ),
            ),
            const Spacer(),
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(height: 64,)
          ],
        ),
      ),
    );
  }
}
