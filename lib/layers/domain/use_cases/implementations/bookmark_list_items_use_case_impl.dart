import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/bookmark_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/bookmark_list_items_use_case.dart';

class BookmarkListItemsUseCaseImpl implements BookmarkListItemsUseCase {
  final BookmarkRepository _bookmarkRepository = locator<BookmarkRepository>();
  List<MediaMetadata>? bookmarkListItems;

  @override
  Future<List<MediaMetadata>> getBookmarkListItems(int bookmarkListId) {
    return _bookmarkRepository.getItems(bookmarkListId);
  }
}
