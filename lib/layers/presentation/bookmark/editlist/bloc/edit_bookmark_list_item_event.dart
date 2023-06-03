import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';

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