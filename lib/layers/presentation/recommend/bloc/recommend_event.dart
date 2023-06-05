part of 'recommend_bloc.dart';

abstract class RecommendEvent extends Equatable {
  const RecommendEvent();

  @override
  List<Object> get props => [];
}

class FetchRecommendationList extends RecommendEvent {
  final MediaType mediaType;

  const FetchRecommendationList({required this.mediaType});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RecommendLoadingStarted { }';
}
