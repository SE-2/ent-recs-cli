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

class SearchFailure extends SearchState {
  final String error;

  const SearchFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class FilterOptionLoading extends SearchState {}

class FilterOptionsLoaded extends SearchState {
  final Map<MediaType, List<String>> categories;

  const FilterOptionsLoaded({required this.categories});
}

class DefaultCategoriesFetched extends SearchState {
  final List<MediaFilter> result;

  const DefaultCategoriesFetched({required this.result});
}