import 'package:flutter/cupertino.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/home/widgets/post_item.dart';

class PostList extends StatelessWidget {
  final List<MediaMetadata> items;

  const PostList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView.builder(
        shrinkWrap: true,
        itemExtent: 140,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return PostItem(
            mediaMetadata: item,
          );
        },
      ),
    );
  }
}
