import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';

class SortOption extends StatelessWidget {
  final VoidCallback? onSortOptionTapped;

  const SortOption({
    Key? key,
    this.onSortOptionTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSortOptionTapped,
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.sort_down,
            size: 24,
          ),
          const SizedBox(width: 4),
          Text(
            AppLocalization.of(context)!.sort,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}