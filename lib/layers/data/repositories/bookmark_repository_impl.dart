import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_bookmarek_data_source.dart';
import 'package:supermedia/layers/data/models/add_item_model.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final RemoteBookmarkDataSource _remoteDataSource = locator<RemoteBookmarkDataSource>();

  @override
  Future<List<BookmarkListItem>> getBookmarkLists() async{
    return _remoteDataSource.getBookmarkLists();
  }

  @override
  Future<List<MediaMetadata>> getBookmarkListItems(int bookmarkListId) async {
    var models = await _remoteDataSource.getBookmarkListItems(bookmarkListId);
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<void> addItemToBookmarkList(String itemId, int bookmarkListId) async {
    _remoteDataSource.addItemToBookmarkList(AddItemModel(
        itemId: itemId, bookmarkListId: bookmarkListId
    ));
  }
}
