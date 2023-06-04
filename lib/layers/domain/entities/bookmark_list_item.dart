import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class BookmarkListItem {
  final int id;
  final String title;
  final List<MediaType> types;

  BookmarkListItem({required this.id, required this.title, required this.types});
}