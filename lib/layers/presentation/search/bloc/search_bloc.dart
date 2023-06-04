import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/search_use_case.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase _searchUseCase = locator<SearchUseCase>();

  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchButtonPressed) {
        emit(SearchLoading());
        try {
          final result = await _searchUseCase.search(event.query);

          if (result.isEmpty) {
            emit(SearchNoResult());
          } else {
            emit(SearchSuccess(result: result));
          }
        } catch (e) {
          emit(SearchFailure(error: e.toString()));
        }
      } else if (event is FilterOptionSelected) {
        emit(FilterOptionLoading());
      } else if (event is FetchDefaultCategories) {
        final result = await _searchUseCase.getMediaFilters();
        emit(DefaultCategoriesFetched(result: result));
      }
    });
  }
}
