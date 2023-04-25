import 'package:flutter/cupertino.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  mediaType,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                if (pages != null)
                  Row(
                    children: [
                      const Icon(CupertinoIcons.book),
                      const SizedBox(width: 8),
                      Text(pages!),
                    ],
                  ),
                if (publishDate != null) const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(CupertinoIcons.calendar),
                    const SizedBox(width: 8),
                    Text(publishDate!),
                  ],
                ),
                if (genre != null) const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(CupertinoIcons.tag),
                    const SizedBox(width: 8),
                    Text(genre!),
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
