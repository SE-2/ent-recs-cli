import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class BookmarkListItemsEvent extends Equatable {
  const BookmarkListItemsEvent();

  @override
  List<Object> get props => [];
}

class FetchBookmarkListItems extends BookmarkListItemsEvent {
  final int bookmarkListId;

  const FetchBookmarkListItems({required this.bookmarkListId});

  @override
  String toString() => 'FetchBookmarkListItems { }';
}

class FilterBookmarkListItems extends BookmarkListItemsEvent {
  final MediaType? mediaType;

  const FilterBookmarkListItems(this.mediaType);

  @override
  String toString() => 'FilterAllBookmarkListItems { }';
}