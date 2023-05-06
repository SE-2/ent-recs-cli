import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final VoidCallback? onSearchIconTapped;

  const SearchBar({
    Key? key,
    this.onSearchIconTapped,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _isFocused = false;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
            color: _isFocused
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: widget.onSearchIconTapped,
              child: const Icon(
                CupertinoIcons.search,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
                style: const TextStyle(fontSize: 16),
                controller: _textController,
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: handleDeleteIconTapped,
              child: const Icon(
                CupertinoIcons.clear_thick,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleDeleteIconTapped() {
    _textController.clear();
  }
}
