import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';

import '../../../domain/entities/media_metadata.dart';
import '../../shared/widgets/media_list_item_property.dart';

class PostItem extends StatelessWidget {
  final MediaMetadata mediaMetadata;

  const PostItem({super.key, required this.mediaMetadata});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ShowMediaScreen.route);
      },
      child: Container(
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
                  Text(
                    mediaMetadata.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 14),
                  ..._buildMediaProperties(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaImage() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(mediaMetadata.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _buildMediaProperties() {
    return List.generate(
      mediaMetadata.properties.entries.length,
      (index) {
        final entry = mediaMetadata.properties.entries.elementAt(index);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaListItemProperty(
              iconGen: _getIconForProperty(entry.key),
              value: entry.value,
            ),
            if (index != mediaMetadata.properties.entries.length - 1)
              const SizedBox(height: 8),
          ],
        );
      },
    );
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
