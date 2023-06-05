import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/edit_bookmark_list_item_use_case.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_event.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_state.dart';

class EditBookmarkListItemBloc extends Bloc<EditBookmarkListItemEvent, EditBookmarkListItemState> {
  final EditBookmarkListItemUseCase _editBookmarkListItemUseCase = locator<EditBookmarkListItemUseCase>();

  EditBookmarkListItemBloc() : super(EditBookmarkListItemInitial()) {
    on<EditBookmarkListItemEvent>((event, emit) async {
      if (event is EditBookmarkApplyButtonClicked) {
        emit(EditBookmarkListItemLoading());
        await _editBookmarkListItemUseCase.addList(event.bookmarkListItem);
        try {
          if (event.bookmarkListItem.id  == null) {
            emit(EditBookmarkListItemSuccess(
                message: AppLocalization.instance.listCreated));
          }
          else {
            emit(EditBookmarkListItemSuccess(
                message: AppLocalization.instance.listEdited));
          }
        } catch (e) {
          emit(EditBookmarkListItemFailure(error: e.toString()));
        }
      }
      else if (event is EditBookmarkDeleteButtonClicked) {
        emit(EditBookmarkListItemLoading());
        await _editBookmarkListItemUseCase.deleteList(event.bookmarkListId);
        try {
          emit(EditBookmarkListItemSuccess(message: AppLocalization.instance.listDeleted));
        } catch (e) {
          emit(EditBookmarkListItemFailure(error: e.toString()));
        }
      }
    });
  }
}