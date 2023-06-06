import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_bookmarek_data_source.dart';
import 'package:supermedia/layers/data/models/add_bookmark_list_model.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final RemoteBookmarkDataSource _remoteDataSource = locator<RemoteBookmarkDataSource>();

  @override
  Future<List<BookmarkListItem>> getLists() async{
    return _remoteDataSource.getLists();
  }

  @override
  Future<void> addNewList(BookmarkListItem bookmarkListItemModel) async {
    if (bookmarkListItemModel.id == null) {
      return _remoteDataSource.addList(
          AddBookmarkListModel(title: bookmarkListItemModel.title,
              types: bookmarkListItemModel.types)
      );
    }
    else {
      return _remoteDataSource.editList(bookmarkListItemModel);
    }
  }

  @override
  Future<void> deleteList(int bookmarkListId) async {
    return _remoteDataSource.deleteList(bookmarkListId);
  }

  @override
  Future<List<MediaMetadata>> getItems(int bookmarkListId) async {
    var models = await _remoteDataSource.getItems(bookmarkListId);
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<void> addItem(String itemId, int bookmarkListId) async {
    return _remoteDataSource.addItem(itemId, bookmarkListId);
  }

  @override
  Future<void> deleteItem(String mediaId) async{
    return _remoteDataSource.deleteItem(mediaId);
  }
}
