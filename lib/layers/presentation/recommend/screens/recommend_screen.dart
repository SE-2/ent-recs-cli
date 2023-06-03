import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/recommend/bloc/recommend_bloc.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';

class RecommendScreen extends StatelessWidget {
  static const String route = '/recommend';

  const RecommendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecommendBloc>(
      create: (_) => locator<RecommendBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(
          title: AppLocalization.of(context)!.recommendScreenTitle,
          showBackButton: true,
        ),
        body: _RecommendForm(),
      ),
    );
  }
}

class _RecommendForm extends StatefulWidget {
  final MediaType mediaType = MediaType.movie;

  @override
  _RecommendFormState createState() => _RecommendFormState();
}

class _RecommendFormState extends State<_RecommendForm> {
  @override
  Widget build(BuildContext context) {
    context.read<RecommendBloc>().add(RecommendLoadingStarted(mediaType: widget.mediaType));

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 32),
      child: Column(
        children: [
          // const SizedBox(height: 12),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          //   child: Row(
          //     children: [
          //       SortOption(
          //         onSortMethodChanged: handleSortOptionTapped,
          //         initialSortMethod: SortMethod.mostRelated,
          //       ),
          //       const SizedBox(width: 16),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 16),
          BlocBuilder<RecommendBloc, RecommendState>(
            builder: (context, state) {
              if (state is RecommendInitial) {
                return Expanded(
                  child: Center(
                    child: Text(AppLocalization.of(context)!.emptyList),
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
}
