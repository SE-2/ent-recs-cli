import 'package:flutter/cupertino.dart';

import 'data.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            width: 188.94,
            height: 250,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/images/categories/${category.imageFileName}',
                width: 188.94,
                height: 250,
              ),
            ),
          ),
          // Positioned.fill(
          //   top: 100,
          //   right: 100,
          //   left: 100,
          //   bottom: 10,
          //   child: Container(
          //     decoration: BoxDecoration(boxShadow: [
          //       BoxShadow(
          //           color: const Color(0xff0D253C).withOpacity(0.4),
          //           blurRadius: 20,)
          //     ]),
          //   ),
          // )
        ],
      ),
    );
  }
}
