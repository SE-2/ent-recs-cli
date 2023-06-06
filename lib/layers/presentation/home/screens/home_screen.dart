import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/models/user_model.dart';
import 'package:supermedia/layers/presentation/home/bloc/explore/explore_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/explore/explore_state.dart';
import 'package:supermedia/layers/presentation/home/bloc/profile/abstract_profile_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/profile/abstract_profile_event.dart';
import 'package:supermedia/layers/presentation/home/bloc/profile/abstract_profile_state.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_event.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_state.dart';
import 'package:supermedia/layers/presentation/home/bloc/trend_items/trend_items_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/trend_items/trend_items_event.dart';
import 'package:supermedia/layers/presentation/home/widgets/category_list.dart';
import 'package:supermedia/layers/presentation/home/widgets/data.dart';
import 'package:supermedia/layers/presentation/home/widgets/post_list.dart';
import 'package:supermedia/layers/presentation/home/widgets/story_list.dart';
import 'package:supermedia/layers/presentation/questionnaire/screens/questionnaire_screen.dart';
import 'package:supermedia/layers/presentation/recommend/screens/recommend_screen.dart';

enum DateFilter { all, today }

class HomeScreen extends StatefulWidget {
  static const String route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrendItemsBloc>(create: (_) => locator<TrendItemsBloc>()),
        BlocProvider<AbstractProfileBloc>(
            create: (_) => locator<AbstractProfileBloc>()),
        BlocProvider<RecentItemsBloc>(
            create: (_) => locator<RecentItemsBloc>()),
        BlocProvider<ExploreBloc>(create: (_) => locator<ExploreBloc>())
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _HomeForm(),
      ),
    );
  }
}

class _HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<_HomeForm> {
  DateFilter _selectedSegment = DateFilter.all;
  TextStyle defaultStyle = const TextStyle(color: Colors.black, fontSize: 8);
  TextStyle selected = const TextStyle(color: Colors.white, fontSize: 10);
  final stories = AppDatabase.stories;

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        notification.metrics.pixels == 0) {
      context.read<RecentItemsBloc>().add(LoadRecentItems());
    }
    return true;
  }

  @override
  void initState() {
    context.read<AbstractProfileBloc>().add(LoadAbstractProfile());
    context.read<RecentItemsBloc>().add(LoadRecentItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExploreBloc, ExploreState>(
      listener: (context, state) {
        if (state is QuestionnaireChecked) {
          if (state.result) {
            Navigator.of(context)
                .pushNamed(RecommendScreen.route, arguments: state.mediaType);
          } else {
            Navigator.of(context).pushNamed(QuestionnaireScreen.route,
                arguments: state.mediaType);
          }
        }
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: _onNotification,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  BlocBuilder<AbstractProfileBloc, AbstractProfileState>(
                    builder: (context, state) {
                      if (state is AbstractProfileFetched) {
                        return _buildAbstractProfile(state.result);
                      } else {
                        return _buildAbstractProfile(UserModel(name: ""));
                      }
                    },
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
                              : defaultStyle,
                        ),
                        1: Text('Today',
                            style: _selectedSegment == DateFilter.today
                                ? selected
                                : defaultStyle)
                      },
                      fixedWidth: 53,
                      height: 24,
                      onValueChanged: (value) {
                        setState(() {
                          if (value == 0) {
                            _selectedSegment = DateFilter.all;
                            context.read<TrendItemsBloc>().add(
                                LoadTrendItems(dateFilter: DateFilter.all));
                          } else {
                            _selectedSegment = DateFilter.today;
                            context.read<TrendItemsBloc>().add(
                                LoadTrendItems(dateFilter: DateFilter.today));
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
                  if (state is RecentItemsEmptyResult) {
                    return const SizedBox(
                      height: 64,
                      child: Center(
                        child: Text('No recent watched media.'),
                      ),
                    );
                  } else if (state is RecentItemsLoading) {
                    return const Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 60,
                            child: Center(child: CircularProgressIndicator())));
                  } else if (state is RecentItemsFetched) {
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
        ),
      ),
    );
  }

  Row _buildAbstractProfile(UserModel userModel) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(24, 55, 15, 0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: NetworkImage(userModel.photoUrl),
                  )),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 52, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${userModel.name}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                'Explore today items',
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 156, 164, 171)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
