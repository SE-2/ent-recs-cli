import 'package:flutter/material.dart';

class MediaListItemProperty extends StatelessWidget {
  final IconData iconGen;
  final String value;

  const MediaListItemProperty(
      {Key? key, required this.iconGen, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconGen,
          size: 16,
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}