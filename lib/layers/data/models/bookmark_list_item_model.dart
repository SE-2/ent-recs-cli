import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class BookmarkListItem {
  final int id;
  final String title;
  final List<MediaType> types;

  BookmarkListItem({required this.id, required this.title, required this.types});

  factory BookmarkListItem.fromJson(Map<String, dynamic> json) {
    return BookmarkListItem(
      id: json['id'] as int,
      title: json['title'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => MediaType.values[e as int])
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'types': types.map((e) => e.index).toList(),
    };
  }
}