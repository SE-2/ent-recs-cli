import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/common/utils/app_localization.dart';

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
