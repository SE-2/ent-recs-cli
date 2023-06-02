import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_bookmarek_data_source.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final RemoteBookmarkDataSource _remoteDataSource = locator<RemoteBookmarkDataSource>();

  Future<List<BookmarkListItem>> getBookmarkLists() {
    return _remoteDataSource.getBookmarkLists();
  }
}
