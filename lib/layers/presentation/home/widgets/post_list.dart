import 'package:flutter/cupertino.dart';
import 'package:supermedia/layers/presentation/home/widgets/post_item.dart';

class PostList extends StatelessWidget {
  final List<PostItem> items;

  const PostList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(children: items));
  }
}
