import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/category/category_selection.dart';
import 'carousel/carousel_slider.dart';
import 'category_item.dart';
import 'data.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SelectionScreen.route);
          },
          child: CarouselSlider.builder(
            itemCount: categories.length,
            itemBuilder: (context, index, realIndex) {
              return AspectRatio(
                aspectRatio: 221.94 / 250,
                child: CategoryItem(
                  category: categories[realIndex],
                  realIndex: realIndex,
                  currentIndex: currentIndex,
                ),
              );
            },
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.45,
              initialPage: 1,
              disableCenter: false,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DotsIndicator(
          dotsCount: categories.length,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            color: const Color(0xffBFC6CC),
            activeColor: const Color(0xff514EB6),
            size: const Size.square(8.0),
            activeSize: const Size(22.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            spacing: const EdgeInsets.all(2),
          ),
        ),
      ],
    );
  }
}
