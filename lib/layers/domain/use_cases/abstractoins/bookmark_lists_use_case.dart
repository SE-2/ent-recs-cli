import 'package:supermedia/layers/data/models/bookmark_list_item.dart';

abstract class BookmarkListsUseCase {
  Future<List<BookmarkListItem>> getBookmarkLists();
}
