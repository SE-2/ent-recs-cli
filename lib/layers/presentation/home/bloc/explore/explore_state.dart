import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class QuestionnaireChecked extends ExploreState {
  final MediaType mediaType;
  final bool result;

  const QuestionnaireChecked({required this.mediaType, required this.result});

  @override
  List<Object> get props => [mediaType, result];
}
