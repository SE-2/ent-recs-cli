import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';

class FilterOption extends StatelessWidget {
  final VoidCallback? onFilterOptionTapped;
  final bool showCircle;

  const FilterOption({
    Key? key,
    this.onFilterOptionTapped,
    required this.showCircle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: onFilterOptionTapped,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              CupertinoIcons.slider_horizontal_3,
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              AppLocalization.of(context)!.filter,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
      if (showCircle)
        const Positioned(
          top: 0,
          left: 0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 5,
          ),
        ),
    ]);
  }
}
