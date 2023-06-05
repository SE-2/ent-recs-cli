import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/questionnaire_use_case.dart';
import 'package:supermedia/layers/presentation/home/bloc/explore/explore_event.dart';
import 'package:supermedia/layers/presentation/home/bloc/explore/explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final QuestionnaireUseCase _questionnaireUseCase =
      locator<QuestionnaireUseCase>();

  ExploreBloc() : super(ExploreInitial()) {
    on<ExploreEvent>(
      (event, emit) async {
        if (event is CheckQuestionnaireRequired) {
          try {
            final result = await _questionnaireUseCase
                .isQuestionnaireFilled(event.mediaType);
            emit(QuestionnaireChecked(mediaType: event.mediaType, result: result));
          } catch (ignored) {}
        }
      },
    );
  }
}
