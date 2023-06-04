import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/category/category_selection.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';
import 'package:supermedia/layers/presentation/recommend/screens/recommend_screen.dart';
import 'package:supermedia/layers/presentation/search/screens/search_screen.dart';
import 'package:supermedia/layers/presentation/setting/screens/settings_screen.dart';
import 'package:supermedia/layers/presentation/shared/multi_screen_bottom_navigation.dart';
import 'package:supermedia/layers/presentation/splash/screens/splashScreen.dart';

class AppRouter {
  final GetIt locator = GetIt.instance;

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );

      case SignupScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return const SignupScreen();
          },
        );

      case MultiScreenBottomNavigation.route:
        return MaterialPageRoute(
          builder: (context) {
            return const MultiScreenBottomNavigation();
          },
        );

      case HomeScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return HomeScreen();
          },
        );

      case ShowMediaScreen.route:
        var id = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) {
            return ShowMediaScreen(
              id: id,
            );
          },
        );

      case RecommendScreen.route:
        var mediaType = routeSettings.arguments as MediaType;

        return MaterialPageRoute(
          builder: (_) {
            return RecommendScreen(mediaType: mediaType);
          },
        );

      case SelectionScreen.route:
        var mediaType = routeSettings.arguments as MediaType;

        return MaterialPageRoute(
          builder: (_) {
            return SelectionScreen(mediaType: mediaType);
          },
        );

      case SearchScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return SearchScreen();
          },
        );

      case SettingsScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return const SettingsScreen();
          },
        );
      default:
        throw Exception('root is not valid');
    }
  }
}
