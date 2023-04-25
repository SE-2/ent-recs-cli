import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/shared/widgets/search_bar.dart';

import 'media_list_item.dart';

class MediaList extends StatelessWidget {
  final String title;
  final List<MediaListItem> mediaList;

  const MediaList({Key? key, required this.title, required this.mediaList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: Colors.black,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  children: const [
                    Icon(CupertinoIcons.sort_down),
                    SizedBox(width: 4),
                    Text('Sort'),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: const [
                    Icon(CupertinoIcons.slider_horizontal_3),
                    SizedBox(width: 4),
                    Text('Filter'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: mediaList.length,
                itemBuilder: (BuildContext context, int index) {
                  return mediaList[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}