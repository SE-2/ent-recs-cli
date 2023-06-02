import 'package:flutter/material.dart';

class CustomChoiceChipGroup2<T> extends StatelessWidget {
  final List<T> items;
  final T selectedItem;
  final Function(T) onItemSelected;
  final String Function(T item) itemLabel;

  const CustomChoiceChipGroup2({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
    required this.itemLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        T item = items[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: ChoiceChip(
            label: Text(
              itemLabel(item),
              style: selectedItem == item
                  ? Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.white)
                  : Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            selected: selectedItem == item,
            onSelected: (bool selected) {
              if (selected) {
                onItemSelected(item);
              }
            },
            selectedColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.background,
            side: BorderSide(
                color: Theme.of(context).colorScheme.tertiaryContainer),
          ),
        );
      },
    );
  }
}