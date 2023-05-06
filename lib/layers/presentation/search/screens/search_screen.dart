import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/presentation/search/bloc/search_bloc.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_search_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/filter_option.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';
import 'package:supermedia/layers/presentation/shared/widgets/sort_option.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => locator<SearchBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Text(
            AppLocalization.of(context)!.searchScreenTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
      child: Column(
        children: [
          AppSearchBar(
            onSearchIconTapped: handleSearchIconTapped,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Row(
              children: [
                SortOption(
                  onSortOptionTapped: handleSortOptionTapped,
                ),
                const SizedBox(width: 16),
                const FilterOption(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return const Expanded(
                  child: Center(
                    child: Text('Empty List.'),
                  ),
                );
              } else if (state is SearchLoading) {
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
                      var media = result[index];

                      return MediaListItem(
                        mediaType: media.type,
                        title: media.title,
                        imageUrl: media.imageUrl,
                        properties: media.properties,
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  void handleSortOptionTapped() {
    // TODO: Implement sorting logic
  }

  void handleFilterOptionTapped() {
    // TODO: Implement filtering logic
  }

  void handleSearchIconTapped(String query) {
    context.read<SearchBloc>().add(SearchButtonPressed(query: query));
  }
}
