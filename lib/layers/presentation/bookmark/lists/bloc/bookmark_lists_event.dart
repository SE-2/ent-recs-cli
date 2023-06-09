import 'package:equatable/equatable.dart';

abstract class BookmarkListsEvent extends Equatable {
  const BookmarkListsEvent();

  @override
  List<Object> get props => [];
}

class FetchBookmarkLists extends BookmarkListsEvent {

  const FetchBookmarkLists();

  @override
  String toString() => 'FetchBookmarkLists { }';
}

class AddItemToBookmarkList extends BookmarkListsEvent {
  final String itemId;
  final int bookmarkListId;

  const AddItemToBookmarkList({ required this.itemId, required this.bookmarkListId });

  @override
  String toString() => 'FetchBookmarkLists { }';
}