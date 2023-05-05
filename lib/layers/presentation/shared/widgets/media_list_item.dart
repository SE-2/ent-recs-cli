import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/gen/assets.gen.dart';

class MediaListItem extends StatelessWidget {
  final String mediaType;
  final String title;
  final String? pages;
  final String? publishDate;
  final String? genre;
  final String imageUrl;

  const MediaListItem({
    Key? key,
    required this.mediaType,
    required this.title,
    this.pages,
    this.publishDate,
    this.genre,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> mediaTypeColors = {
      'Book': const Color(0xff514EB6),
      'Movie': const Color(0xffF50057),
      'Music': const Color(0xff00C853),
      'Podcast': const Color(0xffFF9800),
    };

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 119.52,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 65,
                  height: 24,
                  decoration: BoxDecoration(
                    color: mediaTypeColors[mediaType],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Center(
                    child: Text(
                      mediaType.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 14),
                if (pages != null)
                  Row(
                    children: [
                      Assets.icons.paper.svg(height: 16, width: 16),
                      const SizedBox(width: 8),
                      Text(
                        pages!,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                if (publishDate != null) const SizedBox(height: 10),
                Row(
                  children: [
                    Assets.icons.calendar.svg(height: 16, width: 16),

                    const SizedBox(width: 8),
                    Text(
                      publishDate!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                if (genre != null) const SizedBox(height: 10),
                Row(
                  children: [
                    Assets.icons.film.svg(height: 16, width: 16),
                    const SizedBox(width: 8),
                    Text(
                      genre!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
