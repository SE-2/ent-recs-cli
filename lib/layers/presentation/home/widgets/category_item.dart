import 'package:flutter/material.dart';

import 'data.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int realIndex;
  final int currentIndex;
  final VoidCallback onItemTapped;

  const CategoryItem({
    super.key,
    required this.category,
    required this.realIndex,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTapped,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            'assets/images/categories/${category.imageFileName}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
