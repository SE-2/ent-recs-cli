import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/presentation/recommend/bloc/recommend_bloc.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/filter_option.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';
import 'package:supermedia/layers/presentation/shared/widgets/sort_option.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecommendBloc>(
      create: (_) => locator<RecommendBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(
          title: AppLocalization.of(context)!.searchScreenTitle,
        ),
        body: _RecommendForm(),
      ),
    );
  }
}

class _RecommendForm extends StatefulWidget {
  @override
  _RecommendFormState createState() => _RecommendFormState();
}

class _RecommendFormState extends State<_RecommendForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Row(
              children: [
                SortOption(
                  onSortOptionTapped: handleSortOptionTapped,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<RecommendBloc, RecommendState>(
            builder: (context, state) {
              if (state is RecommendInitial) {
                return const Expanded(
                  child: Center(
                    child: Text('Empty List.'),
                  ),
                );
              } else if (state is RecommendLoading) {
                return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
              } else if (state is RecommendSuccess) {
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

  void handleRecommendIconTapped(String query) {
    context.read<RecommendBloc>().add(RecommendButtonPressed(query: query));
  }
}
