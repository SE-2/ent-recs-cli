import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/bookmark_lists_use_case.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_event.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_state.dart';

class BookmarkListsBloc extends Bloc<BookmarkListsEvent, BookmarkListsState> {
  final BookmarkListsUseCase _recommendUseCase = locator<BookmarkListsUseCase>();

  BookmarkListsBloc() : super(BookmarkListsLoading()) {
    on<BookmarkListsEvent>((event, emit) async {
      if (event is FetchBookmarkLists) {
        emit(BookmarkListsLoading());
        await Future.delayed(const Duration(seconds: 1));
        try {
          final result = await _recommendUseCase.getBookmarkLists();
          if (result.isEmpty) {
            emit(BookmarkListsEmpty());
          } else {
            emit(BookmarkListsSuccess(result: result));
          }
        } catch (e) {
          emit(BookmarkListsFailure(error: e.toString()));
        }
      }
    });
  }
}
