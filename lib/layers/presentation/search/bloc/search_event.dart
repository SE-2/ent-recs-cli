part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  final BuildContext context;

  const SearchEvent({
    required this.context,
  });

  @override
  List<Object> get props => [];
}

class SearchButtonPressed extends SearchEvent {
  final SearchQuery query;

  const SearchButtonPressed({required super.context, required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'SearchButtonPressed { query: $query }';
}

class FilterOptionSelected extends SearchEvent {
  const FilterOptionSelected({required super.context});
}
