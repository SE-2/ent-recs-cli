import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/repositories/bookmark_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/bookmark_lists_use_case.dart';

class BookmarkListsUseCaseImpl implements BookmarkListsUseCase {
  final BookmarkRepository _bookmarkRepository = locator<BookmarkRepository>();

  Future<List<BookmarkListItem>> getBookmarkLists() async {
    return _bookmarkRepository.getBookmarkLists();
  }

  @override
  Future<void> addItemToBookmarkList(String itemId, int bookmarkListId) async{
    return _bookmarkRepository.addItemToBookmarkList(itemId, bookmarkListId);
  }
}
