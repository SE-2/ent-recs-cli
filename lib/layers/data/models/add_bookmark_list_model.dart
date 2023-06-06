class AddBookmarkListModel {
  final String title;
  final List<String> types;

  AddBookmarkListModel({required this.title, required this.types});

  Map<String, dynamic> toJson() {
    return {
      'name': title,
      'mediaTypes': types.join(', '),
    };
  }
}