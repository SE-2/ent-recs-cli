import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class BookmarkRepository {
  Future<List<BookmarkListItem>> getLists();
  Future<void> addNewList(BookmarkListItem bookmarkListItemModel);
  Future<void> deleteList(int bookmarkListId);
  Future<List<MediaMetadata>> getItems(int bookmarkListId);
  Future<void> addItem(String itemId, int bookmarkListId);
  Future<void> deleteItem(String mediaId);
  }
