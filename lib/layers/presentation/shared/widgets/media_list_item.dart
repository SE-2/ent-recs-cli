import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item_property.dart';

class MediaListItem extends StatelessWidget {
  final String mediaType;
  final String title;
  final String imageUrl;
  final Map<String, String> properties;

  const MediaListItem({
    Key? key,
    required this.mediaType,
    required this.title,
    required this.imageUrl,
    required this.properties,
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
          _buildMediaImage(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMediaTypeBadge(mediaTypeColors),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 14),
                ..._buildMediaProperties(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaImage() {
    return Container(
      width: 119.52,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMediaTypeBadge(Map<String, Color> mediaTypeColors) {
    return Container(
      width: 75,
      height: 24,
      decoration: BoxDecoration(
        color: mediaTypeColors[mediaType],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
    );
  }

  List<Widget> _buildMediaProperties() {
    return properties.entries.map((entry) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaListItemProperty(
            iconGen: _getIconForProperty(entry.key),
            value: entry.value,
          ),
          const SizedBox(height: 10),
        ],
      );
    }).toList();
  }

  IconData _getIconForProperty(String propertyKey) {
    switch (propertyKey) {
      case 'pages':
        return Icons.menu_book;
      case 'publishDate':
        return Icons.calendar_today;
      case 'genre':
        return Icons.category;
      case 'director':
        return Icons.movie_filter;
      case 'productionYear':
        return Icons.date_range;
      case 'writer':
        return Icons.create;
      case 'duration':
        return Icons.timer;
      case 'style':
        return Icons.music_note;
      case 'singer':
        return Icons.mic;
      case 'producer':
        return Icons.mic_none;
      default:
        throw UnimplementedError('invalid property key.');
    }
  }
}
