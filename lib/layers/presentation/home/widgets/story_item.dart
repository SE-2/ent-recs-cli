import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/home/widgets/data.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ShowMediaScreen.route);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            Stack(children: [
              story.isViewed ? _viewedStory() : _nonViewedStory(),
              Positioned(
                bottom: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    'assets/images/icons/${story.iconFileName}',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 68,
              child: Text(story.name,
                  style: const TextStyle(fontSize: 12, color: Color(0xff2D4379)),
                  textAlign: TextAlign.center,
                  textWidthBasis: TextWidthBasis.longestLine,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }

  Container _nonViewedStory() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          color: story.category.color, borderRadius: BorderRadius.circular(24)),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(5),
        child: _storyImage(),
      ),
    );
  }

  Widget _viewedStory() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: const [8, 3],
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: _storyImage(),
        ),
      ),
    );
  }

  Widget _storyImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset(
        'assets/images/stories/${story.imageFileName}',
        width: 54,
        height: 54,
      ),
    );
  }
}
