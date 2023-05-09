import 'package:equatable/equatable.dart';


abstract class RecentItemsEvent extends Equatable {}

class LoadRecentItems extends RecentItemsEvent {

  LoadRecentItems();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadRecentItems { }';
}