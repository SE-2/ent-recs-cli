import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/edit_bookmark_list_item_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_bloc.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_event.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_state.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_choice_chip_group2.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';

class BookmarkListItemsScreen extends StatelessWidget {
  static const String route = '/bookmark_items';
  final BookmarkListItem? bookmarkListItem;

  const BookmarkListItemsScreen({Key? key, this.bookmarkListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkListItemsBloc>(
      create: (_) => locator<BookmarkListItemsBloc>(),
      child: Scaffold(
        body: _BookmarkListItemsForm(
          bookmarkListItem: bookmarkListItem,
        ),
      ),
    );
  }
}

class _BookmarkListItemsForm extends StatefulWidget {
  final BookmarkListItem? bookmarkListItem;

  const _BookmarkListItemsForm({required this.bookmarkListItem});

  @override
  _BookmarkListItemsFormState createState() => _BookmarkListItemsFormState();
}

class _BookmarkListItemsFormState extends State<_BookmarkListItemsForm> {
  MediaType? _selectedType;

  @override
  Widget build(BuildContext context) {
    context
        .read<BookmarkListItemsBloc>()
        .add(FetchBookmarkListItems(bookmarkListId: widget.bookmarkListItem!.id!));

    return BlocListener<BookmarkListItemsBloc, BookmarkListItemsState>(
      listener: (context, state) {
        if (state is BookmarkListItemsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 4, 0),
      child: Column(
        children: [
          _buildTypeOptions(),
          BlocBuilder<BookmarkListItemsBloc, BookmarkListItemsState>(
            builder: (context, state) {
              if (state is BookmarkListItemsLoading) {
                return _showLoading();
              } else if (state is BookmarkListItemsSuccess) {
                return _showMediaList(state.result);
              } else if (state is BookmarkListItemsEmpty) {
                return _showEmptyState();
              } else if (state is BookmarkListItemsFailure) {
                Future.delayed(const Duration(milliseconds: 200), () {
                  Navigator.of(context).pop();
                });
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  MediaList _showMediaList(List<MediaMetadata> result) {
    return MediaList(
        items: List.generate(
      result.length,
      (index) {
        var mediaMetadata = result[index];
        return MediaListItem(
          mediaMetadata: mediaMetadata,
        );
      },
    ));
  }

  Expanded _showEmptyState() {
    return Expanded(
      child: Center(
        child: Text(AppLocalization.of(context)!.emptyList),
      ),
    );
  }

  Expanded _showLoading() {
    return const Expanded(
        child: Center(
      child: CircularProgressIndicator(),
    ));
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: widget.bookmarkListItem!.title,
      showBackButton: true,
      action: IconButton(
        splashRadius: 24,
        icon: Assets.icons.editSquare.svg(width: 24, height: 24),
        onPressed: () {
          Navigator.pushNamed(context, EditBookmarkListItemScreen.route, arguments: widget.bookmarkListItem);
          },
      ),
    );
  }

  Widget _buildTypeOptions() {
    List<MediaType?> types = [null, ...?stringsToMediaTypes(widget.bookmarkListItem?.types)];

    return SizedBox(
      height: 48,
      child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomChoiceChipGroup2<MediaType?>(
              items: types,
              selectedItem: _selectedType,
              itemLabel: getMediaTypeValue,
              onItemSelected: (MediaType? selected) {
                  context
                      .read<BookmarkListItemsBloc>()
                      .add(FilterBookmarkListItems(mediaType: selected));
                  setState(() {
                    _selectedType = selected;
                  });
              },
            ),
      ),
    );
  }

  String getMediaTypeValue(MediaType? selected) {
    switch (selected) {
      case null:
        return AppLocalization.of(context)!.allType;
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

  List<MediaType>? stringsToMediaTypes(List<String>? strings) {
  return strings?.map((str) {
    switch (str) {
      case 'music':
        return MediaType.music;
      case 'movie':
        return MediaType.movie;
      case 'book':
        return MediaType.book;
      case 'podcast':
        return MediaType.podcast;
      default:
        throw ArgumentError('Invalid media type string: $str');
    }
  }).toList();
}

  @override
  void dispose() {
    super.dispose();
  }
}
