import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supermedia/layers/data/models/user_model.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/screens/bookmark_list_items_screen.dart';
import 'package:supermedia/layers/presentation/category/category_selection.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';
import 'package:supermedia/layers/presentation/recommend/screens/recommend_screen.dart';
import 'package:supermedia/layers/presentation/search/screens/search_screen.dart';

class AppRouter {
  final GetIt locator = GetIt.instance;

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BookmarkListItemsScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return const BookmarkListItemsScreen();
          },
        );

      case HomeScreen.route:
        var userModel = routeSettings.arguments as UserModel;

        return MaterialPageRoute(
          builder: (_) {
            return HomeScreen(userModel: userModel);
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