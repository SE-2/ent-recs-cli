import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';

abstract class RemoteBookmarkDataSource {
  Future<List<BookmarkListItem>> getBookmarkLists();
  Future<List<MediaMetadataModel>> getBookmarkListItems(int bookmarkListId);
}
