import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/questionnaire_use_case.dart';
import 'package:supermedia/layers/presentation/questionnaire/screens/questionnaire_screen.dart';

part 'questionnaire_event.dart';

part 'questionnaire_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  final QuestionnaireUseCase _questionnaireUseCase =
      locator<QuestionnaireUseCase>();

  QuestionnaireBloc() : super(QuestionnaireInitial()) {
    on<QuestionnaireEvent>((event, emit) async {
      if (event is QuestionnaireRequested) {
        emit(MediaCategoriesLoading());
        final result =
            await _questionnaireUseCase.getMediaCategories(event.mediaType);
        emit(MediaCategoriesFetched(result: result));
      } else if (event is GettingStartedButtonPressed) {
        try {
          await _questionnaireUseCase.submitUserInterests(
              event.mediaType, event.categories);
          emit(UserInterestsSubmitted());
        } catch (e) {
          emit(UserInterestsSubmitFailed(error: e.toString()));
        }
      }
    });
  }
}
