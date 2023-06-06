import 'package:flutter/material.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/domain/entities/bookmark_list_item.dart';

class BookmarkListItems extends StatelessWidget {
  final List<BookmarkListItem> items;
  final Function(BookmarkListItem) onItemClick;
  final Function(BookmarkListItem) onItemEditClick;

  const BookmarkListItems(
      {Key? key, required this.items, required this.onItemClick, required this.onItemEditClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: .0, horizontal: 24.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => onItemClick(items[index]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.icons.categoriesFour.svg(width: 28, height: 28),
                      const SizedBox(width: 16),
                      Text(items[index].title,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w500)),
                      const Spacer(),
                      IconButton(
                        splashRadius: 24,
                        icon: Assets.icons.editSquare.svg(
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onBackground,
                                BlendMode.srcIn),
                            width: 20,
                            height: 20),
                        onPressed: () {onItemEditClick(items[index]);},
                      ),
                    ],
                  ),
                ),
              ),
              if (index != items.length - 1)
                Padding(
                  padding: const EdgeInsets.fromLTRB(48.0, 0.0, 0.0, 12.0),
                  child: Divider(
                    color: Theme.of(context).colorScheme.onSurface,
                    thickness: 1,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
