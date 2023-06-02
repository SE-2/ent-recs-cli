import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class BookmarkRepository {
  Future<List<BookmarkListItem>> getBookmarkLists();
  Future<List<MediaMetadata>> getBookmarkListItems(int bookmarkListId);
  Future<void> addItemToBookmarkList(String itemId, int bookmarkListId);
}
