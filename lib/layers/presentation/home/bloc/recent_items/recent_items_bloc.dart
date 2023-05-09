import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/recent_items_use_case.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_event.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_state.dart';

class RecentItemsBloc extends Bloc<RecentItemsEvent, RecentItemsState> {
  final RecentItemsUseCase _recentItemsUseCase = locator<RecentItemsUseCase>();

  RecentItemsBloc() : super(RecentItemsInitial()) {
    on<RecentItemsEvent>(
      (event, emit) async {
        if (event is LoadRecentItems) {
          emit(RecentItemsLoading());
          try {
            final result = await _recentItemsUseCase.getRecentWatchedMedia();
            emit(RecentItemsSuccess(result: result));
          } catch (e) {
            emit(RecentItemsFailure(error: e.toString()));
          }
        }
      },
    );
  }
}
