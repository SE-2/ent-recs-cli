import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'media_list_item.dart';

class MediaList extends StatelessWidget {
  final List<MediaListItem> items;

  const MediaList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(children: items));
  }
}
