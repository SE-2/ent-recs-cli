import 'package:flutter/material.dart';

class MediaListItemProperty extends StatelessWidget {
  final IconData iconGen;
  final String value;

  const MediaListItemProperty(
      {super.key, required this.iconGen, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconGen,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
