import 'package:flutter/material.dart';

class CustomFilterChipGroup extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Function(String, bool) onSelectionChanged;

  const CustomFilterChipGroup(
      {Key? key,
      required this.items,
      required this.selectedItems,
      required this.onSelectionChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: items
          .map((item) => FilterChip(
                label: Text(
                  item,
                  style: selectedItems.contains(item)
                      ? Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white)
                      : Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                ),
                selected: selectedItems.contains(item),
                onSelected: (bool selected) {
                  onSelectionChanged(item, selected);
                },
                selectedColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.background,
                side: BorderSide(
                    color: Theme.of(context).colorScheme.tertiaryContainer),
                showCheckmark: false,
                avatar: selectedItems.contains(item)
                    ? const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 18,
                      )
                    : null,
              ))
          .toList(),
    );
  }
}
