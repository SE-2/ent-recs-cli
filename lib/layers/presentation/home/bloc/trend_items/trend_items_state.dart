import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/home/widgets/data.dart';

abstract class TrendItemsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrendItemsInitial extends TrendItemsState {}

class TrendItemsLoading extends TrendItemsState {}

class TrendItemsFetched extends TrendItemsState {
  final List<Story> result;

  TrendItemsFetched({required this.result});

  @override
  List<Object?> get props => [result];
}

class TrendItemsEmptyResult extends TrendItemsState {

}

class TrendItemsFailure extends TrendItemsState {
  final String error;

  TrendItemsFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
