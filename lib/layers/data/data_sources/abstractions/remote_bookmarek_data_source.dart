import 'package:supermedia/layers/data/models/bookmark_list_item.dart';

abstract class RemoteBookmarkDataSource {
  Future<List<BookmarkListItem>> getBookmarkLists();
}
