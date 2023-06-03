import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_bloc.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_event.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_state.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_bloc.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_event.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_state.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_primary_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_text_field.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_choice_chip_group.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_choice_chip_group2.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_filter_chip_group.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';

class EditBookmarkListItemScreen extends StatelessWidget {
  static const String route = '/';
  final BookmarkListItem? bookmarkListItem;

  const EditBookmarkListItemScreen({Key? key, this.bookmarkListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditBookmarkListItemBloc>(
      create: (_) => locator<EditBookmarkListItemBloc>(),
      child: const Scaffold(
        body: _EditBookmarkListItemForm(
          bookmarkListItem: null,
        ),
      ),
    );
  }
}

class _EditBookmarkListItemForm extends StatefulWidget {
  final BookmarkListItem? bookmarkListItem;

  const _EditBookmarkListItemForm({required this.bookmarkListItem});

  @override
  _EditBookmarkListItemFormState createState() => _EditBookmarkListItemFormState();
}

class _EditBookmarkListItemFormState extends State<_EditBookmarkListItemForm> {
  final List<String> _selectedCategories = [];
  final GlobalKey<AppTextFieldState> _appTextFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditBookmarkListItemBloc, EditBookmarkListItemState>(
      listener: (context, state) {
        if (state is EditBookmarkListItemFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
              key: const Key('listNameTextFiled'),
              label: AppLocalization.of(context)!.listName,
              hint: AppLocalization.of(context)!.enterYourEmail
          ),
          const SizedBox(height: 24,),
          Text(
              AppLocalization.of(context)!.typeTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 16,),
          _buildTypeOptions(),
          const Spacer(),
          BlocBuilder<EditBookmarkListItemBloc, EditBookmarkListItemState>(
            builder: (context, state) {
              if (state is EditBookmarkListItemLoading) {
                return const AppPrimaryButton.loading();
              } else {
                return AppPrimaryButton(
                  text: AppLocalization.of(context)!.apply,
                  onPressed: () {
                    // context
                    //     .read<EditBookmarkListItemBloc>()
                    //     .add(ApplyButtonClicked(
                    //   bookmarkListItem: BookmarkListItem(
                    //     id: widget.bookmarkListItem!.id,
                    //     title: (_appTextFieldKey.currentState as AppTextFieldState).text,
                    //     types: _selectedCategories.map((e) => MediaType.)
                    //   )
                    // ));
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: widget.bookmarkListItem == null ?
      AppLocalization.of(context)!.addNewList :
      AppLocalization.of(context)!.editList(widget.bookmarkListItem!.title),
      showBackButton: true,
      action: IconButton(
        splashRadius: 24,
        icon: Assets.icons.editSquare.svg(width: 24, height: 24),
        onPressed: () {},
      ),
    );
  }

  Widget _buildTypeOptions() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomFilterChipGroup(
          items: MediaType.values.map((e) => getMediaTypeValue(e)).toList(),
          selectedItems: _selectedCategories,
          onSelectionChanged: (category, selected) => setState(() {
            if (selected) {
              _selectedCategories.add(category);
            } else {
              _selectedCategories.remove(category);
            }
          }),
        ),
      ),
    );
  }

  String getMediaTypeValue(MediaType selected) {
    switch (selected) {
      case MediaType.music:
        return AppLocalization.of(context)!.musicType;
      case MediaType.movie:
        return AppLocalization.of(context)!.movieType;
      case MediaType.podcast:
        return AppLocalization.of(context)!.podcastType;
      case MediaType.book:
        return AppLocalization.of(context)!.ebookType;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
