part of 'recommend_bloc.dart';

abstract class RecommendState extends Equatable {
  const RecommendState();

  @override
  List<Object> get props => [];
}

class RecommendInitial extends RecommendState {}

class RecommendLoading extends RecommendState {}

class RecommendSuccess extends RecommendState {
  final List<MediaMetadata> result;

  const RecommendSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class RecommendNoResult extends RecommendState {}

class RecommendFailure extends RecommendState {
  final String error;

  const RecommendFailure({required this.error});

  @override
  List<Object> get props => [error];
}
