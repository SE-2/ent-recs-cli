import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';


abstract class ExploreEvent extends Equatable {}

class CheckQuestionnaireRequired extends ExploreEvent {
  final MediaType mediaType;

  CheckQuestionnaireRequired({required this.mediaType});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'CheckQuestionnaireRequired { }';
}