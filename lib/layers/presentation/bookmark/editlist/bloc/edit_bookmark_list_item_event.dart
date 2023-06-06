import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';

abstract class EditBookmarkListItemEvent extends Equatable {
  const EditBookmarkListItemEvent();

  @override
  List<Object> get props => [];
}

class EditBookmarkApplyButtonClicked extends EditBookmarkListItemEvent {
  final BookmarkListItem bookmarkListItem;

  const EditBookmarkApplyButtonClicked({ required this.bookmarkListItem });

  @override
  String toString() => 'ApplyButtonClicked { }';
}

class EditBookmarkDeleteButtonClicked extends EditBookmarkListItemEvent {
  final int bookmarkListId;

  const EditBookmarkDeleteButtonClicked({ required this.bookmarkListId });

  @override
  String toString() => 'DeleteButtonClicked { }';
}