import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';
import 'package:supermedia/layers/presentation/search/bloc/search_bloc.dart';
import 'package:supermedia/layers/presentation/shared/widgets/CenterScreenMessage.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_search_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/filter_modal.dart';
import 'package:supermedia/layers/presentation/shared/widgets/filter_option.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';
import 'package:supermedia/layers/presentation/shared/widgets/sort_option.dart';

class SearchScreen extends StatelessWidget {
  static const String route = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => locator<SearchBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(
          title: AppLocalization.of(context)!.searchScreenTitle,
        ),
        body: _SearchForm(),
      ),
    );
  }
}

class _SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<_SearchForm> {
  late MediaType selectedMediaType = MediaType.music;
  late List<String> selectedCategories = [];
  late Map<MediaType, List<String>> defaultCategories = {};
  late SortMethod selectedSortMethod = SortMethod.mostRelated;
  String query = '';

  @override
  void initState() {
    context.read<SearchBloc>().add(FetchDefaultCategories(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selectedCategoriesCount = selectedCategories.length;

    return BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is DefaultCategoriesFetched) {
            for (MediaFilter filter in state.result) {
              defaultCategories[filter.mediaType] = filter.categories;
            }
            handleFilterOptionTapped();
          } else if (state is SearchFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 8, 32, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSearchBar(
                onSearchIconTapped: handleSearchIconTapped,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Row(
                  children: [
                    FilterOption(
                      onFilterOptionTapped: handleFilterOptionTapped,
                      showCircle: selectedCategoriesCount > 0,
                    ),
                    const SizedBox(width: 16),
                    SortOption(
                      onSortMethodChanged: handleSortMethodChanged,
                      initialSortMethod: SortMethod.mostRelated,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  } else if (state is SearchSuccess) {
                    var result = state.result;

                    return MediaList(
                      items: List.generate(
                        result.length,
                        (index) {
                          var mediaMetadata = result[index];
                          return MediaListItem(
                            mediaMetadata: mediaMetadata,
                          );
                        },
                      ),
                    );
                  } else if (state is SearchNoResult) {
                    return const CenterScreenMessage(
                      message: 'Search had no result...',
                    );
                  } else {
                    return const CenterScreenMessage(
                      message: 'Try search something...',
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }

  void handleSortMethodChanged(SortMethod sortMethod) {
    setState(() {
      selectedSortMethod = sortMethod;
    });
    if (query != '') {
      handleSearchIconTapped(query);
    }
  }

  void handleFilterOptionTapped() {
    FilterModal.show(
      context: context,
      defaultCategories: defaultCategories,
      onApplyFiltersTapped: onApplyFiltersTapped,
      initialSelectedType: selectedMediaType,
      initialSelectedCategories: selectedCategories,
    );
  }

  void onApplyFiltersTapped(MediaType mediaType, List<String>? categories) {
    setState(() {
      selectedMediaType = mediaType;
      selectedCategories = categories ?? [];
    });
    if (query != '') {
      handleSearchIconTapped(query);
    }
  }

  void handleSearchIconTapped(String query) {
    this.query = query;
    MediaFilter filter = MediaFilter(
        mediaType: selectedMediaType, categories: selectedCategories);
    SearchQuery searchQuery = SearchQuery(
        query: query.trim(), filter: filter, sortMethod: selectedSortMethod);
    context
        .read<SearchBloc>()
        .add(SearchButtonPressed(context: context, query: searchQuery));
  }
}
