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
        color: Colors.black,
        borderRadius: BorderRadius.circular(32),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            'assets/images/categories/${widget.category.imageFileName}',
          ),
        ),
      ),
    );
  }
}
