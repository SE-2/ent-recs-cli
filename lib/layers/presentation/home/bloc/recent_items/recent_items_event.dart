import 'package:equatable/equatable.dart';


abstract class RecentItemsEvent extends Equatable {}

class LoadRecentItems extends RecentItemsEvent {
   final String query;

  LoadRecentItems({required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'LoadRecentItems { query: $query }';
}