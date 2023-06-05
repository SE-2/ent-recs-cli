import 'package:equatable/equatable.dart';

abstract class EditBookmarkListItemState extends Equatable {
  const EditBookmarkListItemState();

  @override
  List<Object> get props => [];
}

class EditBookmarkListItemInitial extends EditBookmarkListItemState {}

class EditBookmarkListItemLoading extends EditBookmarkListItemState {}

class EditBookmarkListItemSuccess extends EditBookmarkListItemState {
  final String message;

  const EditBookmarkListItemSuccess({ required this.message });
}

class EditBookmarkListItemFailure extends EditBookmarkListItemState {
  final String error;

  const EditBookmarkListItemFailure({required this.error});

  @override
  List<Object> get props => [error];
}
