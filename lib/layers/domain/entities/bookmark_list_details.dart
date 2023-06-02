import 'package:supermedia/layers/data/models/bookmark_list_details_model.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class BookmarkListDetails {
  final int id;
  final String title;
  final List<MediaType> types;
  final List<MediaMetadata> media;

  BookmarkListDetails({
    required this.id,
    required this.title,
    required this.types,
    required this.media,
  });

  factory BookmarkListDetails.fromModel(BookmarkListDetailsModel model) {
    return BookmarkListDetails(
      id: model.id,
      title: model.title,
      types: model.types,
      media: model.media.map((e) => MediaMetadata.fromModel(e)).toList(),
    );
  }
}