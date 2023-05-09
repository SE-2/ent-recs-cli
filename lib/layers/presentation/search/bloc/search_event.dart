part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchButtonPressed extends SearchEvent {
  final String query;

  const SearchButtonPressed({required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'SearchButtonPressed { query: $query }';
}
