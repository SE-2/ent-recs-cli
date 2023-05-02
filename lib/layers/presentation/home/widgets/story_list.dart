import 'package:flutter/cupertino.dart';
import 'package:supermedia/layers/presentation/home/widgets/story_item.dart';
import 'package:supermedia/layers/presentation/home/widgets/data.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required this.stories,
  });

  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final story = stories[index];
            return StoryItem(
              story: story,
            );
          }),
    );
  }
}
