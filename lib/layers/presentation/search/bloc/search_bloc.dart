import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/models/media_list_item_model.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/search_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase _searchUseCase = locator<SearchUseCase>();

  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchButtonPressed) {
        emit(SearchLoading());
        await Future.delayed(const Duration(seconds: 1));
        try {
          final result = await _searchUseCase.search(event.query);
          emit(SearchSuccess(result: result));
        } catch (e) {
          emit(SearchFailure(error: e.toString()));
        }
      }
    });
  }
}
