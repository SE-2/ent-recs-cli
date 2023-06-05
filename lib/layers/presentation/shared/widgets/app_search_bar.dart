import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';

class AppSearchBar extends StatefulWidget {
  final void Function(String) onSearchIconTapped;

  const AppSearchBar({
    Key? key,
    required this.onSearchIconTapped,
  }) : super(key: key);

  @override
  AppSearchBarState createState() => AppSearchBarState();
}

class AppSearchBarState extends State<AppSearchBar> {
  bool _isFocused = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth;

    return Container(
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
            onTap: () {
              widget.onSearchIconTapped(_textController.text);
            },
            child: const Icon(
              CupertinoIcons.search,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppLocalization.of(context)!.search,
              ),
              style: const TextStyle(fontSize: 16),
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  _isFocused = value.isNotEmpty;
                });
              },
              onTap: () {
                setState(() {
                  _isFocused = true;
                });
              },
              onSubmitted: (value) {
                widget.onSearchIconTapped(_textController.text);
                setState(() {
                  _isFocused = false;
                });
              },
              textInputAction: TextInputAction.search,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              _textController.clear();
              setState(() {
                _isFocused = false;
              });
            },
            child: _textController.text.isNotEmpty
                ? const Icon(
                    CupertinoIcons.clear_thick,
                    size: 20,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
