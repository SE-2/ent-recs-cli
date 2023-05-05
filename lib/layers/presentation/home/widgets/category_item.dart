import 'package:flutter/cupertino.dart';
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
    return Positioned.fill(
      child: Transform.scale(
        scale: widget.realIndex == widget.currentIndex ? 1 : 0.8,
        child: Container(
          // width: 221.94,
          // height: 250,
          // margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
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
        ),
      ),
    );
  }
}
