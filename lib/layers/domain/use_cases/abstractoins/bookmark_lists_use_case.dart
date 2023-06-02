import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';

abstract class BookmarkListsUseCase {
  Future<List<BookmarkListItem>> getBookmarkLists();
  Future<void> addItemToBookmarkList(String itemId, int bookmarkListId);
}
