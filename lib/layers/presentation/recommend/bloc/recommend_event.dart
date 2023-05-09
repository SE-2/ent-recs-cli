part of 'recommend_bloc.dart';

abstract class RecommendEvent extends Equatable {
  const RecommendEvent();

  @override
  List<Object> get props => [];
}

class RecommendLoadingStarted extends RecommendEvent {

  const RecommendLoadingStarted();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RecommendLoadingStarted { }';
}
