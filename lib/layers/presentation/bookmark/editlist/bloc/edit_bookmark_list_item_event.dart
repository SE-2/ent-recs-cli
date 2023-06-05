import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';

abstract class EditBookmarkListItemEvent extends Equatable {
  const EditBookmarkListItemEvent();

  @override
  List<Object> get props => [];
}

class ApplyButtonClicked extends EditBookmarkListItemEvent {
  final BookmarkListItem bookmarkListItem;

  const ApplyButtonClicked({ required this.bookmarkListItem });

  @override
  String toString() => 'ApplyButtonClicked { }';
}

class DeleteButtonClicked extends EditBookmarkListItemEvent {
  final int bookmarkListId;

  const DeleteButtonClicked({ required this.bookmarkListId });

  @override
  String toString() => 'DeleteButtonClicked { }';
}