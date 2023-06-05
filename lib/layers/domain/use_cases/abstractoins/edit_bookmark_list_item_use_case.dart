import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';

abstract class EditBookmarkListItemUseCase {
  Future<void> addList(BookmarkListItem bookmarkListItem);
  Future<void> deleteList(int bookmarkListId);
}
