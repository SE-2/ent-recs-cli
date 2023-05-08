import 'package:flutter/material.dart';
import 'data.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  final int realIndex;
  final int currentIndex;

  const CategoryItem({
    super.key,
    required this.category,
    required this.realIndex,
    required this.currentIndex,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(22),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Image.asset(
          'assets/images/categories/${widget.category.imageFileName}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
