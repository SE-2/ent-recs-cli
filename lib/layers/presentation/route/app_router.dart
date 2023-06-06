import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/edit_bookmark_list_item_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/screens/bookmark_list_items_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/screens/bookmark_lists_screen.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';
import 'package:supermedia/layers/presentation/questionnaire/screens/questionnaire_screen.dart';
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

      case QuestionnaireScreen.route:
        var mediaType = routeSettings.arguments as MediaType;

        return MaterialPageRoute(
          builder: (_) {
            return QuestionnaireScreen(mediaType: mediaType);
          },
        );

      case SearchScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return const SearchScreen();
          },
        );

      case SettingsScreen.route:
        return MaterialPageRoute(
          builder: (_) {
            return const SettingsScreen();
          },
        );

        case BookmarkListsScreen.route:
          var itemId = routeSettings.arguments as String?;

          return MaterialPageRoute(
            builder: (_) {
              return BookmarkListsScreen(itemIdToBookmark: itemId);
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
