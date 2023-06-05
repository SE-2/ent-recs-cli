import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/recommend_use_case.dart';

part 'recommend_event.dart';

part 'recommend_state.dart';

class RecommendBloc extends Bloc<RecommendEvent, RecommendState> {
  final RecommendUseCase _recommendUseCase = locator<RecommendUseCase>();

  RecommendBloc() : super(RecommendInitial()) {
    on<RecommendEvent>((event, emit) async {
      if (event is FetchRecommendationList) {
        emit(RecommendLoading());
        try {
          final result = await _recommendUseCase.recommend(event.mediaType);

          if (result.isEmpty) {
            emit(RecommendNoResult());
          } else {
            emit(RecommendSuccess(result: result));
          }
        } catch (e) {
          emit(RecommendFailure(error: e.toString()));
        }
      }
    });
  }
}
