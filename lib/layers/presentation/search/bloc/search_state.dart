part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<MediaMetadata> result;

  const SearchSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class SearchNoResult extends SearchState {}

class SearchFailure extends SearchState {
  final String error;

  const SearchFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class MediaFiltersLoading extends SearchState {}

class MediaFiltersFetched extends SearchState {
  final List<MediaFilter> result;

  const MediaFiltersFetched({required this.result});
}
