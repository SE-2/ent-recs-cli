import 'package:supermedia/layers/data/models/bookmark_list_item.dart';

abstract class BookmarkRepository {
  Future<List<BookmarkListItem>> getBookmarkLists();
}
