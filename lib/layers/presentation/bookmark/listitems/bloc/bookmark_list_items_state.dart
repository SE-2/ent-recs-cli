import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';


abstract class BookmarkListItemsState extends Equatable {
  const BookmarkListItemsState();

  @override
  List<Object> get props => [];
}

class BookmarkListItemsLoading extends BookmarkListItemsState {}

class BookmarkListItemsEmpty extends BookmarkListItemsState {}

class BookmarkListItemsSuccess extends BookmarkListItemsState {
  final List<MediaMetadata> result;

  const BookmarkListItemsSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class BookmarkListItemsFailure extends BookmarkListItemsState {
  final String error;

  const BookmarkListItemsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
