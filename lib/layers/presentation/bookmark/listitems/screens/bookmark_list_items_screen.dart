import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_bloc.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_event.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/bloc/bookmark_list_items_state.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list.dart';
import 'package:supermedia/layers/presentation/shared/widgets/media_list_item.dart';

class BookmarkListItemsScreen extends StatelessWidget {
  static const String route = '/';
  final BookmarkListItem? bookmarkListItem;

  const BookmarkListItemsScreen({Key? key, this.bookmarkListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkListItemsBloc>(
      create: (_) => locator<BookmarkListItemsBloc>(),
      child: Scaffold(
        body: _BookmarkListItemsForm(bookmarkListItem: bookmarkListItem,),
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
    context.read<BookmarkListItemsBloc>().add(const FetchBookmarkListItems(bookmarkListId: 10));

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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildTypeOptions(),
          BlocBuilder<BookmarkListItemsBloc, BookmarkListItemsState>(
            builder: (context, state) {
              if (state is BookmarkListItemsLoading) {
                return _showLoading();
              }
              else if (state is BookmarkListItemsSuccess) {
                return _showMediaList(state.result);
              }
              else if (state is BookmarkListItemsEmpty) {
                return _showEmptyState();
              }
              else if (state is BookmarkListItemsFailure) {
                Future.delayed(const Duration(milliseconds: 200), () {
                  Navigator.of(context).pop();
                });
                return Container();
              }
              else {
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
        )
    );
  }

  Expanded _showEmptyState() {
    return const Expanded(
      child: Center(
        child: Text('Empty List.'),
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
        onPressed: () {},
      ),
    );
  }

  Widget _buildTypeOptions() {
    List<MediaType?> types = [null, ...widget.bookmarkListItem!.types.toList()];

    return SizedBox(
      height: 50, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        itemBuilder: (BuildContext context, int index) {
          MediaType? type = types[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ChoiceChip(
              label: Text(type == null ? 'All' : getMediaTypeValue(type)),
              selected: _selectedType == type,
              onSelected: (bool selected) {
                setState(() {
                  _selectedType = selected ? type : MediaType.movie;
                });
              },
            ),
          );
        },
      ),
    );
  }

  String getMediaTypeValue(MediaType? selected) {
    switch (selected) {
      case null:
        return 'All';
      case MediaType.music:
        return 'Music';
      case MediaType.movie:
        return 'Movie';
      case MediaType.podcast:
        return 'Podcast';
      case MediaType.book:
        return 'EBook';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
