part of 'recommend_bloc.dart';

abstract class RecommendEvent extends Equatable {
  const RecommendEvent();

  @override
  List<Object> get props => [];
}

class RecommendLoadingStarted extends RecommendEvent {
  final MediaType mediaType;

  const RecommendLoadingStarted({required this.mediaType});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RecommendLoadingStarted { }';
}
