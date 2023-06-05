part of 'questionnaire_bloc.dart';

abstract class QuestionnaireEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class QuestionnaireRequested extends QuestionnaireEvent {
  final MediaType mediaType;

  QuestionnaireRequested({required this.mediaType});
}

class GettingStartedButtonPressed extends QuestionnaireEvent{
  final MediaType mediaType;
  final List<String> categories;

  GettingStartedButtonPressed({required this.mediaType, required this.categories});
}