import 'package:flutter/material.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item_property.dart';

class MediaListItem extends StatelessWidget {
  final MediaMetadata mediaMetadata;

  const MediaListItem({
    Key? key,
    required this.mediaMetadata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<MediaType, Color> mediaTypeColors = {
      MediaType.book: const Color(0xff514EB6),
      MediaType.movie: const Color(0xffF50057),
      MediaType.music: const Color(0xff00C853),
      MediaType.podcast: const Color(0xffFF9800),
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
                  mediaMetadata.title,
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
          image: NetworkImage(mediaMetadata.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMediaTypeBadge(Map<MediaType, Color> mediaTypeColors) {
    return Container(
      width: 75,
      height: 24,
      decoration: BoxDecoration(
        color: mediaTypeColors[mediaMetadata.type],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Center(
        child: Text(
          mediaMetadata.type.name.toUpperCase(),
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
    return mediaMetadata.properties.entries.map((entry) {
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

  static IconData _getIconForProperty(MediaProperty property) {
    switch (property) {
      case MediaProperty.pages:
        return Icons.menu_book;
      case MediaProperty.publishDate:
        return Icons.calendar_today;
      case MediaProperty.genre:
        return Icons.category;
      case MediaProperty.director:
        return Icons.movie_filter;
      case MediaProperty.productionYear:
        return Icons.date_range;
      case MediaProperty.writer:
        return Icons.create;
      case MediaProperty.duration:
        return Icons.timer;
      case MediaProperty.style:
        return Icons.music_note;
      case MediaProperty.singer:
        return Icons.mic;
      case MediaProperty.producer:
        return Icons.mic_none;
    }
  }
}
