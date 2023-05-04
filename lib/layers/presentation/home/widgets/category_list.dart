import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/cupertino.dart';

import 'carousel/carousel_slider.dart';
import 'category_item.dart';
import 'data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    int currentIndex = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
          child: CarouselSlider.builder(
              itemCount: categories.length,
              itemBuilder: (context, index, realIndex) {
                return CategoryItem(
                  category: categories[realIndex],
                );
              },
              options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 0.75,
                  aspectRatio: 1.2,
                  initialPage: 0,
                  disableCenter: false,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) => currentIndex = index,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  scrollPhysics: const BouncingScrollPhysics())),
        ),
        const SizedBox(height: 30,),
       
        CarouselIndicator(
          count: 4,
          color: const Color(0xffBFC6CC),
          activeColor: const Color(0xff514EB6),
          width: 20,
          index: currentIndex,
        ),
      ],
    );
  }
}
