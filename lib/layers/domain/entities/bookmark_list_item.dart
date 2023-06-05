class BookmarkListItem {
  final int? id;
  final String title;
  final List<String> types;

  BookmarkListItem({required this.id, required this.title, required this.types});

  factory BookmarkListItem.fromJson(Map<String, dynamic> json) {
    return BookmarkListItem(
      id: json['playlistID'],
      title: json['name'],
      types: json['types'].split(', ').toList(),
    );
  }

  static List<BookmarkListItem> fromJsonList(List<dynamic> jsonString) {
    return jsonString.map((json) => BookmarkListItem.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': title,
      'mediaTypes': types.join(', '),
    };
  }
}