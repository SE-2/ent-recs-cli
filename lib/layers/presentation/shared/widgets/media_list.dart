import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/shared/widgets/search_bar.dart';

import 'media_list_item.dart';

class MediaList extends StatelessWidget {
  final String title;
  final List<MediaListItem> mediaList;
  final bool showSearchBar;
  final bool showFilter;
  final bool showSort;

  const MediaList({
    Key? key,
    required this.title,
    required this.mediaList,
    this.showSearchBar = true,
    this.showFilter = true,
    this.showSort = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showSearchBar) ...[
              const SearchBar(),
              const SizedBox(height: 16),
            ],
            if (showFilter || showSort) ...[
              Row(
                children: [
                  if (showSort) ...[
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.sort_down,
                          size: 24,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Sort',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                  ],
                  if (showFilter) ...[
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.slider_horizontal_3,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Filter',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),
            ],
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