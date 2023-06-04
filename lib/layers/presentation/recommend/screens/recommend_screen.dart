import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/recommend/bloc/recommend_bloc.dart';
import 'package:supermedia/layers/presentation/shared/widgets/CenterScreenMessage.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';

class RecommendScreen extends StatelessWidget {
  static const String route = '/recommend';
  final MediaType? mediaType;

  const RecommendScreen({Key? key, this.mediaType}) : super(key: key);

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
        body: _RecommendForm(mediaType: mediaType!),
      ),
    );
  }
}

class _RecommendForm extends StatefulWidget {
  final MediaType mediaType;

  const _RecommendForm({required this.mediaType});

  @override
  _RecommendFormState createState() => _RecommendFormState();
}

class _RecommendFormState extends State<_RecommendForm> {
  @override
  void initState() {
    fetchRecommendations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecommendBloc, RecommendState>(
      listener: (context, state) {
        if (state is RecommendFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 8, 32, 32),
        child: Column(
          children: [
            BlocBuilder<RecommendBloc, RecommendState>(
              builder: (context, state) {
                return _buildRecommendList(state);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendList(RecommendState state) {
    if (state is RecommendLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
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
    } else if (state is RecommendNoResult) {
      return const CenterScreenMessage(message: 'No recommendation for you...');
    } else {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Unable to load recommendations.',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: fetchRecommendations,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
  }

  void fetchRecommendations() {
    context
        .read<RecommendBloc>()
        .add(FetchRecommendationList(mediaType: widget.mediaType));
  }
}
