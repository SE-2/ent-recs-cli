import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supermedia/layers/data/models/user_model.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/edit_bookmark_list_item_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/screens/bookmark_list_items_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/screens/bookmark_lists_screen.dart';
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
            return const BookmarkListsScreen();
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
            return const ShowMediaScreen();
          },
        );

        case RecommendScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return const RecommendScreen();
          },
        );

        case SelectionScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return const SelectionScreen();
          },
        );

        case SearchScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return const SearchScreen();
          },
        );

        case BookmarkListItemsScreen.route:
          var bookmarkListItem = routeSettings.arguments as BookmarkListItem;

          return MaterialPageRoute(
          builder: (_) {
            return BookmarkListItemsScreen(bookmarkListItem: bookmarkListItem);
          },
        );

        case EditBookmarkListItemScreen.route:
          var bookmarkListItem = routeSettings.arguments as BookmarkListItem?;

          return MaterialPageRoute(
          builder: (_) {
            return EditBookmarkListItemScreen(bookmarkListItem: bookmarkListItem);
          },
        );
      default:
        throw Exception('root is not valid');
    }
  }
}