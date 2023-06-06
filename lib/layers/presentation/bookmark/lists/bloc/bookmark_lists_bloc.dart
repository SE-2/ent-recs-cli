import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/bookmark_lists_use_case.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_event.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_state.dart';

class BookmarkListsBloc extends Bloc<BookmarkListsEvent, BookmarkListsState> {
  final BookmarkListsUseCase _bookmarkListsUseCase = locator<BookmarkListsUseCase>();

  BookmarkListsBloc() : super(BookmarkListsLoading()) {
    on<BookmarkListsEvent>((event, emit) async {
      if (event is FetchBookmarkLists) {
        emit(BookmarkListsLoading());
        try {
          final result = await _bookmarkListsUseCase.getBookmarkLists();
          if (result.isEmpty) {
            emit(BookmarkListsEmpty());
          } else {
            emit(BookmarkListsSuccess(result: result));
          }
        } catch (e) {
          emit(BookmarkListsFailure(error: e.toString()));
        }
      }
      else if (event is AddItemToBookmarkList) {
        emit(BookmarkListsLoading());
        try {
          await _bookmarkListsUseCase.addItemToBookmarkList(event.itemId, event.bookmarkListId);
            emit(AddItemSuccess());
        } catch (e) {
          emit(BookmarkListsFailure(error: e.toString()));
        }
      }
    });
  }
}
