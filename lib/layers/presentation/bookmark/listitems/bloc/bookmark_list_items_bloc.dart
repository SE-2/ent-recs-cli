import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/bookmark_list_items_use_case.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_event.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_state.dart';

class BookmarkListItemsBloc extends Bloc<BookmarkListItemsEvent, BookmarkListItemsState> {
  final BookmarkListItemsUseCase _bookmarkListItemsUseCase = locator<BookmarkListItemsUseCase>();
  List<MediaMetadata>? _bookmarkListItems;

  BookmarkListItemsBloc() : super(BookmarkListItemsLoading()) {
    on<BookmarkListItemsEvent>((event, emit) async {
      if (event is FetchBookmarkListItems) {
        _fetchBookmarkListItems(emit, event.bookmarkListId);
      }
      if (event is FilterBookmarkListItems) {
        _filterList(emit, event.mediaType);
      }
    });
  }

  void _filterList(Emitter<BookmarkListItemsState> emit, MediaType? mediaType) {
     emit(BookmarkListItemsLoading());
    var result = List<MediaMetadata>.from(_bookmarkListItems!);
    try {
      if (mediaType != null) {
        result = result.where((item) => item.type == mediaType).toList();
      }
      if (result.isEmpty) {
        emit(BookmarkListItemsEmpty());
      } else {
        emit(BookmarkListItemsSuccess(result: result));
      }
    } catch (e) {
      emit(BookmarkListItemsFailure(error: e.toString()));
    }
  }

  Future<void> _fetchBookmarkListItems(Emitter<BookmarkListItemsState> emit, int bookmarkListId) async {
    emit(BookmarkListItemsLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final result = await _bookmarkListItemsUseCase.getBookmarkListItems(bookmarkListId);
      _bookmarkListItems = result;
      if (result.isEmpty) {
        emit(BookmarkListItemsEmpty());
      } else {
        emit(BookmarkListItemsSuccess(result: result));
      }
    } catch (e) {
      emit(BookmarkListItemsFailure(error: e.toString()));
    }
  }
}