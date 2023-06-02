import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item.dart';


abstract class BookmarkListsState extends Equatable {
  const BookmarkListsState();

  @override
  List<Object> get props => [];
}

class BookmarkListsLoading extends BookmarkListsState {}

class BookmarkListsEmpty extends BookmarkListsState {}

class BookmarkListsSuccess extends BookmarkListsState {
  final List<BookmarkListItem> result;

  const BookmarkListsSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class BookmarkListsFailure extends BookmarkListsState {
  final String error;

  const BookmarkListsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
