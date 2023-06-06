import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/screens/bookmark_lists_screen.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/search/screens/search_screen.dart';
import 'package:supermedia/layers/presentation/setting/screens/settings_screen.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_bottom_navigation.dart';

class MultiScreenBottomNavigation extends StatefulWidget {
  static const String route = '/navigation';

  const MultiScreenBottomNavigation({super.key});

  @override
  MultiScreenBottomNavigationState createState() =>
      MultiScreenBottomNavigationState();
}

class MultiScreenBottomNavigationState
    extends State<MultiScreenBottomNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const BookmarkListsScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // _pageController.jumpToPage(index);
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNavigation(
        initialIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
