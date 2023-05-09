import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/presentation/search/bloc/search_bloc.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';

class SearchScreen extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: Text('center'))),
      ],
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
