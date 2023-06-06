import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomNavigation extends StatefulWidget {
  final int initialIndex;
  final void Function(int) onItemTapped;

  const AppBottomNavigation(
      {Key? key, required this.initialIndex, required this.onItemTapped})
      : super(key: key);

  @override
  AppBottomNavigationState createState() => AppBottomNavigationState();
}

class AppBottomNavigationState extends State<AppBottomNavigation> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    widget.onItemTapped(_currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.background,
            blurRadius: 50,
            spreadRadius: 0,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 0
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                child: const Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 1
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                child: const Icon(CupertinoIcons.search),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 2
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                child: const Icon(CupertinoIcons.square_list),
              ),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == 3
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                child: const Icon(Icons.settings),
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
