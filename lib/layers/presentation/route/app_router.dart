import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/category/category_selection.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';
import 'package:supermedia/layers/presentation/recommend/screens/recommend_screen.dart';
import 'package:supermedia/layers/presentation/search/screens/search_screen.dart';

class AppRouter {
  final GetIt locator = GetIt.instance;

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SignupScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return const SignupScreen();
          },
        );

      case HomeScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return HomeScreen();
          },
        );

        case ShowMediaScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return ShowMediaScreen();
          },
        );

        case RecommendScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return RecommendScreen();
          },
        );

        case SelectionScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return SelectionScreen();
          },
        );

        case SearchScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return SearchScreen();
          },
        );
      default:
        throw Exception('root is not valid');
    }
  }
}