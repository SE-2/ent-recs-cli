import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class BookmarkListItemsUseCase {
  Future<List<MediaMetadata>> getBookmarkListItems(int bookmarkListId);
}
