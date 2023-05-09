import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class RecentItemsState extends Equatable {
  @override
  List<Object> get props => [];
}

class RecentItemsInitial extends RecentItemsState {}

class RecentItemsLoading extends RecentItemsState {}

class RecentItemsSuccess extends RecentItemsState {
  final List<MediaMetadata> result;

  RecentItemsSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class RecentItemsFailure extends RecentItemsState {
  final String error;

  RecentItemsFailure({required this.error});

  @override
  List<Object> get props => [error];
}