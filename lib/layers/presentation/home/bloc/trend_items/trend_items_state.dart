import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class TrendItemsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrendItemsInitial extends TrendItemsState {}

class TrendItemsLoading extends TrendItemsState {}

class TrendItemsSuccess extends TrendItemsState {
  final List<MediaMetadata> trendItems;

  TrendItemsSuccess({required this.trendItems});

  @override
  List<Object?> get props => [trendItems];
}

class TrendItemsFailure extends TrendItemsState {
  final String error;

  TrendItemsFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
