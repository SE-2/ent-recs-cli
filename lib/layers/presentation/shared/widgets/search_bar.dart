import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth;

    return Focus(
      onFocusChange: (isFocused) {
        setState(() {
          _isFocused = isFocused;
        });
      },
      child: Container(
        height: 52,
        width: containerWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          border: Border.all(
            color: _isFocused
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              CupertinoIcons.search,
              size: 20,
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(width: 8),
            Icon(
              CupertinoIcons.clear_thick,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
