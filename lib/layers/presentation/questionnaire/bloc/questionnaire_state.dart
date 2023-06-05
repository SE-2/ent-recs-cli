part of 'questionnaire_bloc.dart';

abstract class QuestionnaireState extends Equatable {
  const QuestionnaireState();

  @override
  List<Object> get props => [];
}

class QuestionnaireInitial extends QuestionnaireState {}

class MediaCategoriesLoading extends QuestionnaireState {}

class MediaCategoriesFetched extends QuestionnaireState {
  final List<MediaCategory> result;

  const MediaCategoriesFetched({required this.result});
}

class UserInterestsSubmitted extends QuestionnaireState {}
class UserInterestsSubmitFailed extends QuestionnaireState {
  final String error;

  const UserInterestsSubmitFailed({required this.error});
}
