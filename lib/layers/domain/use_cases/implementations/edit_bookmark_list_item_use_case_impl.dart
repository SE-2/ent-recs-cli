import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/repositories/bookmark_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/edit_bookmark_list_item_use_case.dart';

class EditBookmarkListItemUseCaseImpl implements EditBookmarkListItemUseCase{
  final BookmarkRepository _bookmarkRepository = locator<BookmarkRepository>();

  @override
  Future<void> addList(BookmarkListItem bookmarkListItem) {
    return _bookmarkRepository.addNewList(bookmarkListItem);
  }

  @override
  Future<void> deleteList(int bookmarkListId) async{
    return _bookmarkRepository.deleteList(bookmarkListId);
  }
}
