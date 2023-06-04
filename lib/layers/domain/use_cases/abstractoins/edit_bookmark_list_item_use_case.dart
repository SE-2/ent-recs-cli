import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';

abstract class EditBookmarkListItemUseCase {
  Future<void> addListToBookmarkLists(BookmarkListItemModel bookmarkListItem);
}
