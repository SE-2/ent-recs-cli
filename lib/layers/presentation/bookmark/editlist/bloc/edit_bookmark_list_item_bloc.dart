import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/bookmark_list_items_use_case.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_event.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_state.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_event.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_state.dart';

class EditBookmarkListItemBloc extends Bloc<EditBookmarkListItemEvent, EditBookmarkListItemState> {
  final BookmarkListItemsUseCase _bookmarkListItemsUseCase = locator<BookmarkListItemsUseCase>();
  List<MediaMetadata>? _bookmarkListItems;

  EditBookmarkListItemBloc() : super(EditBookmarkListItemInitial()) {
    on<EditBookmarkListItemEvent>((event, emit) async {
      emit(EditBookmarkListItemLoading());

      try {
          emit(EditBookmarkListItemSuccess());
      } catch (e) {
        emit(EditBookmarkListItemFailure(error: e.toString()));
      }
    });
  }
}