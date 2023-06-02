import 'package:flutter/material.dart';
import 'package:supermedia/gen/assets.gen.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';

class BookmarkListItems extends StatelessWidget {
  final List<BookmarkListItem> items;
  final Function(BookmarkListItem) onItemClick;

  const BookmarkListItems({Key? key, required this.items, required this.onItemClick}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: .0, horizontal: 24.0),
          child: InkWell(
            onTap: () => onItemClick(items[index]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.icons.categoriesFour.svg(width: 28, height: 28),
                    const SizedBox(width: 16),
                    Text(
                      items[index].title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500
                      )
                    ),
                    const Spacer(),
                    IconButton(
                      splashRadius: 24,
                      icon: Assets.icons.editSquare.svg(width: 20, height: 20),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
                if (index != items.length - 1)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 8.0),
                    child: Divider(
                      color: Color(0xFFE3E7EC),
                      thickness: 1,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}