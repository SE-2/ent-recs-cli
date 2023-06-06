import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class RecentItemsState extends Equatable {
  @override
  List<Object> get props => [];
}

class RecentItemsInitial extends RecentItemsState {}

class RecentItemsLoading extends RecentItemsState {}

class RecentItemsFetched extends RecentItemsState {
  final List<MediaMetadata> result;

  RecentItemsFetched({required this.result});

  @override
  List<Object> get props => [result];
}

class RecentItemsEmptyResult extends RecentItemsState {

}

class RecentItemsFailure extends RecentItemsState {
  final String error;

  RecentItemsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
