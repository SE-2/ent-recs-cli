import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';

abstract class TrendItemsEvent extends Equatable {}

class LoadTrendItems extends TrendItemsEvent {
  final DateFilter dateFilter;

  LoadTrendItems({required this.dateFilter});

  @override
  List<Object> get props => [dateFilter];

  @override
  String toString() => 'LoadTrendItems { dateFilter: $dateFilter }';
}