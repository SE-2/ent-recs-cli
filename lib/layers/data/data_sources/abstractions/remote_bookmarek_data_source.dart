import 'package:supermedia/layers/data/models/add_bookmark_list_model.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';

abstract class RemoteBookmarkDataSource {
  Future<List<BookmarkListItem>> getLists();
  Future<void> addList(AddBookmarkListModel addBookmarkListModel);
  Future<void> editList(BookmarkListItem bookmarkList);
  Future<void> deleteList(int bookmarkListId);
  Future<List<MediaMetadataModel>> getItems(int bookmarkListId);
  Future<void> addItem(String itemId, int bookmarkListId);
  Future<void> deleteItem(String itemId);
  }
