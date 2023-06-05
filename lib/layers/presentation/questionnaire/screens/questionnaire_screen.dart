import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/questionnaire/bloc/questionnaire_bloc.dart';
import 'package:supermedia/layers/presentation/recommend/screens/recommend_screen.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_primary_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';

class MediaCategory {
  final String name;
  final String image;

  MediaCategory(this.name, this.image);
}

class QuestionnaireScreen extends StatelessWidget {
  static const String route = '/questionnaire';
  final MediaType? mediaType;

  const QuestionnaireScreen({super.key, this.mediaType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionnaireBloc>(
        create: (_) => locator<QuestionnaireBloc>(),
        child: Scaffold(
          appBar: CustomAppBar(
            title: AppLocalization.of(context)!.questionnaireScreenTitle,
            showBackButton: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: _QuestionnaireForm(mediaType: mediaType!),
        ));
  }
}

class _QuestionnaireForm extends StatefulWidget {
  final MediaType mediaType;

  const _QuestionnaireForm({Key? key, required this.mediaType})
      : super(key: key);

  @override
  _QuestionnaireFormState createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<_QuestionnaireForm> {
  final List<MediaCategory> selectedCategories = [];

  @override
  void initState() {
    context
        .read<QuestionnaireBloc>()
        .add(QuestionnaireRequested(mediaType: widget.mediaType));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionnaireBloc, QuestionnaireState>(
        listener: (context, state) {
          if (state is UserInterestsSubmitted) {
            Navigator.pop(context);
            Navigator.pushNamed(context, RecommendScreen.route,
                arguments: widget.mediaType);
          } else if (state is UserInterestsSubmitFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
    child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
        builder: (context, state) {
      if (state is MediaCategoriesFetched) {
        return _buildMediaCategories(state.result);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }

  Widget _buildMediaCategories(List<MediaCategory> categories) {
    final crossAxisCount = (MediaQuery.of(context).size.width / 120).floor();

    final aspectRatio =
        (MediaQuery.of(context).size.width) / (crossAxisCount * 160);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Text(
          AppLocalization.of(context)!.questionnaireScreenMessage,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(height: 20),
      Expanded(
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 64),
          childAspectRatio: aspectRatio,
          children: categories.map((category) {
            final isSelected = selectedCategories.contains(category);
            return GestureDetector(
              onTap: () => setState(() => isSelected
                  ? selectedCategories.remove(category)
                  : selectedCategories.add(category)),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('assets/images/default_category.png')
                          .image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                if (isSelected)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text(category.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.check_circle_outlined,
                        color: Colors.white70,
                        size: 25,
                      ),
                    ),
                  ),
              ]),
            );
          }).toList(),
        ),
      ),
      const SizedBox(height: 24),
      SizedBox(
        height: 50,
        width: 170,
        child: AppPrimaryButton(
            text: AppLocalization.of(context)!.getStarted,
            onPressed: () {
              _onGetStartedButtonPressed(selectedCategories.length);
            },
            icon: const Icon(
              Icons.arrow_forward,
              size: 16,
            ),
            isEnabled: selectedCategories.length >= 5),
      ),
      const SizedBox(height: 24),
    ]);
  }

  void _onGetStartedButtonPressed(int selectedCategoriesLength) {
    if (selectedCategoriesLength >= 5) {
      context.read<QuestionnaireBloc>().add(GettingStartedButtonPressed(
          mediaType: widget.mediaType,
          categories: selectedCategories.map((e) => e.name).toList()));
    }
  }
}
