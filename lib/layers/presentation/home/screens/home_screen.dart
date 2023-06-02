import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/models/user_model.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_event.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_state.dart';
import 'package:supermedia/layers/presentation/home/bloc/trend_items/trend_items_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/trend_items/trend_items_event.dart';
import 'package:supermedia/layers/presentation/home/widgets/category_list.dart';
import 'package:supermedia/layers/presentation/home/widgets/data.dart';
import 'package:supermedia/layers/presentation/home/widgets/post_list.dart';
import 'package:supermedia/layers/presentation/home/widgets/story_list.dart';

enum DateFilter { all, today }

class HomeScreen extends StatelessWidget {
  static const String route = '/home';
  final UserModel? userModel;

  const HomeScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrendItemsBloc>(create: (_) => locator<TrendItemsBloc>()),
        BlocProvider<RecentItemsBloc>(
            create: (_) => locator<RecentItemsBloc>()),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _HomeForm(userModel: userModel!),
      ),
    );
  }
}

class _HomeForm extends StatefulWidget {
  final UserModel userModel;

  const _HomeForm({super.key, required this.userModel});

  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<_HomeForm> {
  DateFilter _selectedSegment = DateFilter.all;
  TextStyle defaul = const TextStyle(color: Colors.black, fontSize: 8);
  TextStyle selected = const TextStyle(color: Colors.white, fontSize: 10);
  final stories = AppDatabase.stories;

  @override
  Widget build(BuildContext context) {
    context.read<RecentItemsBloc>().add(LoadRecentItems());

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 55, 15, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: NetworkImage(widget.userModel.photoUrl!),
                        )),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 52, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${widget.userModel.name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      'Explore today items',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 156, 164, 171)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 78, 8, 0),
                child: CustomSlidingSegmentedControl(
                  children: {
                    0: Text(
                      'All',
                      style: _selectedSegment == DateFilter.all
                          ? selected
                          : defaul,
                    ),
                    1: Text('Today',
                        style: _selectedSegment == DateFilter.today
                            ? selected
                            : defaul)
                  },
                  fixedWidth: 53,
                  height: 24,
                  onValueChanged: (value) {
                    setState(() {
                      if (value == 0) {
                        _selectedSegment = DateFilter.all;
                        context
                            .read<TrendItemsBloc>()
                            .add(LoadTrendItems(dateFilter: DateFilter.all));
                      } else {
                        _selectedSegment = DateFilter.today;
                        context
                            .read<TrendItemsBloc>()
                            .add(LoadTrendItems(dateFilter: DateFilter.today));
                      }
                    });
                  },
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 241, 246),
                      borderRadius: BorderRadius.circular(24)),
                  thumbDecoration: BoxDecoration(
                    color: const Color.fromARGB(255, 81, 78, 182),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  innerPadding: const EdgeInsets.all(2),
                ),
              )
            ],
          ),
          StoryList(
            stories: stories,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'See what’s good for you!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const CategoryList(),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 22, 0, 16),
            child: Text(
              'Recent watched',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          BlocBuilder<RecentItemsBloc, RecentItemsState>(
            builder: (context, state) {
              if (state is RecentItemsInitial) {
                // todo center vertically
                return Container(
                  height: 64,
                  child: const Center(
                    child: Text('Empty List.'),
                  ),
                );
              } else if (state is RecentItemsLoading) {
                return const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              } else if (state is RecentItemsSuccess) {
                var result = state.result;
                return PostList(
                  items: result,
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
}
