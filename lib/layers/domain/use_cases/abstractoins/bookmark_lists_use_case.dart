import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';

abstract class BookmarkListsUseCase {
  Future<List<BookmarkListItem>> getBookmarkLists();
  Future<void> addItemToBookmarkList(String itemId, int bookmarkListId);
}
