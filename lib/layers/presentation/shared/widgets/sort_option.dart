import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortOption extends StatefulWidget {
  final Function(SortMethod) onSortMethodChanged;
  final SortMethod initialSortMethod;

  const SortOption({
    Key? key,
    required this.onSortMethodChanged,
    required this.initialSortMethod,
  }) : super(key: key);

  @override
  SortOptionState createState() => SortOptionState();
}

class SortOptionState extends State<SortOption> {
  late SortMethod _selectedSortMethod;

  @override
  void initState() {
    super.initState();
    _selectedSortMethod = widget.initialSortMethod;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortMethod>(
      onSelected: (SortMethod sortMethod) {
        setState(() {
          _selectedSortMethod = sortMethod;
        });
        widget.onSortMethodChanged(sortMethod);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SortMethod>>[
        const PopupMenuItem<SortMethod>(
          value: SortMethod.mostRelated,
          child: Text('Most Related'),
        ),
        const PopupMenuItem<SortMethod>(
          value: SortMethod.popularity,
          child: Text('Popularity'),
        ),
      ],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            CupertinoIcons.sort_down,
            size: 20,
          ),
          const SizedBox(width: 2),
          Text(
            _sortMethodToString(_selectedSortMethod),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  String _sortMethodToString(SortMethod sortMethod) {
    switch (sortMethod) {
      case SortMethod.mostRelated:
        return 'Most Related';
      case SortMethod.popularity:
        return 'Popularity';
      default:
        return 'Most Related';
    }
  }
}

enum SortMethod { mostRelated, popularity }

extension SortMethodExtension on SortMethod {
  String toJson() {
    switch (this) {
      case SortMethod.mostRelated:
        return 'MOST_RELATED';
      case SortMethod.popularity:
        return 'POPULARITY';
      default:
        throw ArgumentError('Unsupported sort method value: $this');
    }
  }
}