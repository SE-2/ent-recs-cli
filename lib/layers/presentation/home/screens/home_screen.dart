import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/home_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/home_event.dart';
import 'package:supermedia/layers/presentation/home/widgets/story_list.dart';
import 'package:supermedia/layers/presentation/home/widgets/data.dart';

enum DateFilter { all, today }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateFilter _selectedSegment = DateFilter.all;
  TextStyle defaul = const TextStyle(color: Colors.black, fontSize: 8);
  TextStyle selected = const TextStyle(color: Colors.white, fontSize: 10);

  final stories = AppDatabase.stories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 55, 15, 0),
                child: Image.asset(
                  'assets/images/icons/profile_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 52, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hi, Mohammad',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
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
                  fixedWidth: 52,
                  height: 24,
                  onValueChanged: (value) {
                    setState(() {
                      if (value == 0) {
                        _selectedSegment = DateFilter.all;
                      } else {
                        _selectedSegment = DateFilter.today;
                      }
                    });
                  },
                  // onValueChanged: (value) {
                  //   context.read<HomeBloc>().add(
                  //         DateFilterChanged(index: value),
                  //       );
                  // },
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
          const Text(
            'See what’s good for you!',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff0D253C)),
          )
          // _CategoryList()
        ]),
      ),
    );
  }
}
