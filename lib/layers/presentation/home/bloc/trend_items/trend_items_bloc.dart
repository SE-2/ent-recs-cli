import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/trend_items_use_case.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/home/bloc/trend_items/trend_items_event.dart';
import 'package:supermedia/layers/presentation/home/bloc/trend_items/trend_items_state.dart';

class TrendItemsBloc extends Bloc<TrendItemsEvent, TrendItemsState> {
  final TrendItemsUseCase _trendItemsUseCase = locator<TrendItemsUseCase>();

  TrendItemsBloc() : super(TrendItemsInitial()) {
    on<TrendItemsEvent>(
      (event, emit) async {
        if (event is LoadTrendItems) {
          emit(TrendItemsLoading());
          try {
            final List<MediaMetadata> result;
            if (event.dateFilter == DateFilter.all) {
              result = await _trendItemsUseCase.getAllTimesTrendMedia();
            } else if (event.dateFilter == DateFilter.today) {
              result = await _trendItemsUseCase.getTodayTrendMedia();
            } else {
              throw UnimplementedError('dateFilter $DateFilter is not implemented.');
            }
            emit(TrendItemsSuccess(trendItems: result));
          } catch (e) {
            emit(TrendItemsFailure(error: e.toString()));
          }
        }
      },
    );
  }
}
