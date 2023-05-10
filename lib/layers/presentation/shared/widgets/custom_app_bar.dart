import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.outline,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          : null,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      centerTitle: true,
    );
  }
}
