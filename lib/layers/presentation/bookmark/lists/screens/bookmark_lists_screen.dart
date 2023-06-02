import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_bloc.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_event.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/bloc/bookmark_lists_state.dart';
import 'package:supermedia/layers/presentation/bookmark/lists/widget/bookmark_lists.dart';
import 'package:supermedia/layers/presentation/shared/widgets/app_primary_button.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';

class BookmarkListsScreen extends StatelessWidget {
  static const String route = '/';

  const BookmarkListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkListsBloc>(
      create: (_) => locator<BookmarkListsBloc>(),
      child: Scaffold(
        body: _BookmarkListsForm(),
      ),
    );
  }
}

class _BookmarkListsForm extends StatefulWidget {
  @override
  _BookmarkListsFormState createState() => _BookmarkListsFormState();
}

class _BookmarkListsFormState extends State<_BookmarkListsForm> {
  @override
  Widget build(BuildContext context) {
    context.read<BookmarkListsBloc>().add(const FetchBookmarkLists());

    return BlocListener<BookmarkListsBloc, BookmarkListsState>(
      listener: (context, state) {
        if (state is BookmarkListsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
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
          }
          else if (state is BookmarkListsSuccess) {
            return BookmarkListItems(items: state.result);
          }
          else if (state is BookmarkListsEmpty) {
            return _showEmptyState();
          }
          else if (state is BookmarkListsFailure) {
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

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: AppPrimaryButton(
        text: AppLocalization.of(context)!.createNewList,
        onPressed: () {},
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppLocalization.of(context)!.bookmarkListScreenTitle,
      showBackButton: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
