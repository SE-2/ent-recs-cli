import 'package:supermedia/layers/data/models/add_item_model.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';

abstract class RemoteBookmarkDataSource {
  Future<List<BookmarkListItem>> getBookmarkLists();
  Future<List<MediaMetadataModel>> getBookmarkListItems(int bookmarkListId);
  Future<void> addItemToBookmarkList(AddItemModel addItemModel);
  Future<void> addListToBookmarkLists(BookmarkListItemModel addItemModel);
}
