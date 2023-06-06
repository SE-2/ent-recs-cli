import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';
import 'package:supermedia/layers/presentation/bookmark/editlist/edit_bookmark_list_item_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/listitems/screens/bookmark_list_items_screen.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_bloc.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_event.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_state.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/widget/bookmark_lists.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_primary_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';

class BookmarkListsScreen extends StatelessWidget {
  static const String route = '/bookmarkList';
  final String? itemIdToBookmark;

  const BookmarkListsScreen({Key? key, this.itemIdToBookmark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkListsBloc>(
      create: (_) => locator<BookmarkListsBloc>(),
      child: Scaffold(
        body: _BookmarkListsForm(itemIdToBookmark: itemIdToBookmark),
      ),
    );
  }
}

class _BookmarkListsForm extends StatefulWidget {
  final String? itemIdToBookmark;

  const _BookmarkListsForm({this.itemIdToBookmark});

  @override
  _BookmarkListsFormState createState() => _BookmarkListsFormState();
}

class _BookmarkListsFormState extends State<_BookmarkListsForm> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final GlobalKey<ScaffoldMessengerState> globalScaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    context.read<BookmarkListsBloc>().add(const FetchBookmarkLists());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<BookmarkListsBloc, BookmarkListsState>(
      listener: (context, state) {
        if (state is BookmarkListsFailure) {
          var snackBar = SnackBar(content: Text(state.error));
          globalScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
          Future.delayed(const Duration(milliseconds: 1000), () {
            Navigator.of(context).pop();
          });
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomButton(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<BookmarkListsBloc, BookmarkListsState>(
        builder: (context, state) {
          if (state is BookmarkListsLoading) {
            return _showLoading();
          } else if (state is BookmarkListsSuccess) {
            return BookmarkListItems(items: state.result,
              onItemClick: (bookmarkListItem) { handleItemClicked(context, bookmarkListItem); },
              onItemEditClick: (bookmarkListItem) {
                Navigator.pushNamed(context, EditBookmarkListItemScreen.route, arguments: bookmarkListItem)
                    .then((result) => {
                  context.read<BookmarkListsBloc>().add(const FetchBookmarkLists())
                });
              }
            );
          } else if (state is BookmarkListsEmpty) {
            return _showEmptyState();
          } else if (state is BookmarkListsFailure || state is AddItemSuccess) {
            if (state is BookmarkListsFailure) {
              var snackBar = SnackBar(content: Text(state.error));
              globalScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
            }
            else if (state is AddItemSuccess) {
              var snackBar = SnackBar(content: Text(AppLocalization.of(context)!.itemAddedSuccessfully));
              globalScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
            }
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.of(context).pop();
            });
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void handleItemClicked(BuildContext context, BookmarkListItem bookmarkListItem) {
    if (widget.itemIdToBookmark == null) {
      Navigator.pushNamed(context, BookmarkListItemsScreen.route, arguments: bookmarkListItem);
    } else {
      context.read<BookmarkListsBloc>().add(
          AddItemToBookmarkList(
              itemId: widget.itemIdToBookmark!,
              bookmarkListId: bookmarkListItem.id!
          )
      );
    }
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
        child: Center(child: CircularProgressIndicator()));
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: AppPrimaryButton(
        text: AppLocalization.of(context)!.createNewList,
        onPressed: ()  {
          Navigator.pushNamed(context, EditBookmarkListItemScreen.route).then((result) => {
            context.read<BookmarkListsBloc>().add(const FetchBookmarkLists())
          }
          );
        },
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: widget.itemIdToBookmark == null
            ? AppLocalization.of(context)!.bookmarkListScreenTitle
            : AppLocalization.of(context)!.selectListToAdd,
        showBackButton: true);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
