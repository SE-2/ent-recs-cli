part of 'recommend_bloc.dart';

abstract class RecommendEvent extends Equatable {
  const RecommendEvent();

  @override
  List<Object> get props => [];
}

class RecommendButtonPressed extends RecommendEvent {
  final String query;

  const RecommendButtonPressed({required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'RecommendButtonPressed { query: $query }';
}
