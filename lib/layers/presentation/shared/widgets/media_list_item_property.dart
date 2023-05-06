import 'package:flutter/material.dart';
import 'package:supermedia/gen/assets.gen.dart';

class MediaListItemProperty extends StatelessWidget {
  final SvgGenImage iconGen;
  final String value;

  const MediaListItemProperty(
      {super.key, required this.iconGen, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconGen.svg(height: 16, width: 16),
        const SizedBox(width: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
