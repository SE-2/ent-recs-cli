import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_bloc.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_event.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/bloc/edit_bookmark_list_item_state.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_primary_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_text_field.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_filter_chip_group.dart';

class EditBookmarkListItemScreen extends StatelessWidget {
  static const String route = '/edit_bookmark';
  final BookmarkListItem? bookmarkListItem;

  const EditBookmarkListItemScreen({Key? key, this.bookmarkListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditBookmarkListItemBloc>(
      create: (_) => locator<EditBookmarkListItemBloc>(),
      child: Scaffold(
        body: _EditBookmarkListItemForm(
          bookmarkListItem: bookmarkListItem,
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
  final GlobalKey<ScaffoldMessengerState> globalScaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  final List<String> _selectedCategories = [];
  final GlobalKey<AppTextFieldState> _appTextFieldKey = GlobalKey();

  @override
  void initState() {
    if (widget.bookmarkListItem != null) {
      _selectedCategories.addAll(
        widget.bookmarkListItem!.types
            .map((category) => category[0].toUpperCase() + category.substring(1))
            .toList()
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditBookmarkListItemBloc, EditBookmarkListItemState>(
      listener: (context, state) {
        if (state is EditBookmarkListItemFailure) {
            var snackBar = SnackBar(content: Text(state.error));
            globalScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
        }
        else if (state is EditBookmarkListItemSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pop(context);
          });
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
            key: _appTextFieldKey,
            label: AppLocalization.of(context)!.listName,
            hint: AppLocalization.of(context)!.enterListName,
            initialText: widget.bookmarkListItem?.title ?? "",
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
                  onPressed: () { _onApplyButtonPressed(context); },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _onApplyButtonPressed(BuildContext context) {
    context
        .read<EditBookmarkListItemBloc>()
        .add(EditBookmarkApplyButtonClicked(
      bookmarkListItem: BookmarkListItem(
        id: widget.bookmarkListItem?.id,
          title: (_appTextFieldKey.currentState as AppTextFieldState).text,
        types: _selectedCategories.map((category) => category.toLowerCase()).toList()
      )
    ));
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: widget.bookmarkListItem == null ?
      AppLocalization.of(context)!.addNewList :
      AppLocalization.of(context)!.editList(widget.bookmarkListItem!.title),
      showBackButton: true,
        action: widget.bookmarkListItem?.id != null? IconButton(
          icon: const Icon(CupertinoIcons.trash_fill),
          color: Colors.red,
          onPressed: () {
            context
                .read<EditBookmarkListItemBloc>()
                .add(EditBookmarkDeleteButtonClicked(bookmarkListId: widget.bookmarkListItem!.id!));
          },
        ) : null,
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
