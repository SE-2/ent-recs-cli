import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/repositories/bookmark_repository.dart';

class EditBookmarkListItemUseCaseImpl {
  final BookmarkRepository _bookmarkRepository = locator<BookmarkRepository>();

  Future<void> addListToBookmarkLists(BookmarkListItemModel bookmarkListItem) {
    return _bookmarkRepository.addListToBookmarkLists(bookmarkListItem);
  }
}
